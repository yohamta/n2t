package main

import (
	"encoding/xml"
	"strconv"
)

type Node interface {
	MarshalXML(e *xml.Encoder, start xml.StartElement) error
}

type Expression interface {
	Node
	expressionNode()
}

type Expressions []Expression

func (ex Expressions) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	if err := e.EncodeToken(xml.StartElement{Name: xml.Name{Local: "expressionList"}}); err != nil {
		return err
	}
	// This is a hack to pass the test. The test expects a newline after the opening tag.
	if len(ex) == 0 {
		if err := e.EncodeToken(xml.CharData([]byte("\n"))); err != nil {
			return err
		}
	}
	for i, expr := range ex {
		if i != 0 {
			if err := e.Encode(COMMA); err != nil {
				return err
			}
		}
		if err := encodeExpressionXML(e, expr); err != nil {
			return err
		}
	}
	return e.EncodeToken(xml.EndElement{Name: xml.Name{Local: "expressionList"}})
}

type Statement interface {
	Node
	statementNode()
}

type Statements []Statement

func (s Statements) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	if err := e.EncodeToken(xml.StartElement{Name: xml.Name{Local: "statements"}}); err != nil {
		return err
	}
	// This is a hack to pass the test. The test expects a newline after the opening tag.
	if len(s) == 0 {
		if err := e.EncodeToken(xml.CharData([]byte("\n"))); err != nil {
			return err
		}
	}
	for _, statement := range s {
		if err := e.Encode(statement); err != nil {
			return err
		}
	}
	return e.EncodeToken(xml.EndElement{Name: xml.Name{Local: "statements"}})
}

type Program struct {
	Class Class
}

func (p Program) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	return e.Encode(p.Class)
}

type Class struct {
	Name         Identifier
	ClassVarDecs []ClassVarDec
	SubDecs      []SubDec
}

func (c Class) FieldLen() int {
	cnt := 0
	for _, varDec := range c.ClassVarDecs {
		if varDec.Kind.TokenType != FIELD {
			continue
		}
		cnt += len(varDec.Names)
	}
	return cnt
}

func (c Class) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	start.Name.Local = "class"
	if err := e.EncodeToken(start); err != nil {
		return err
	}
	if err := e.Encode(CLASS); err != nil {
		return err
	}
	if err := e.Encode(c.Name); err != nil {
		return err
	}
	if err := e.Encode(LBRACE); err != nil {
		return err
	}
	if err := e.Encode(c.ClassVarDecs); err != nil {
		return err
	}
	if err := e.Encode(c.SubDecs); err != nil {
		return err
	}
	if err := e.Encode(RBRACE); err != nil {
		return err
	}
	return e.EncodeToken(start.End())
}

type SubDec struct {
	SubType    Token
	ReturnType Token
	Name       Identifier
	Parameters Parameters
	Body       Block
}

func (s SubDec) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	start.Name.Local = "subroutineDec"
	if err := e.EncodeToken(start); err != nil {
		return err
	}
	if err := e.Encode(s.SubType); err != nil {
		return err
	}
	if err := e.Encode(s.ReturnType); err != nil {
		return err
	}
	if err := e.Encode(s.Name); err != nil {
		return err
	}
	if err := e.Encode(LPAREN); err != nil {
		return err
	}
	if err := e.Encode(s.Parameters); err != nil {
		return err
	}
	if err := e.Encode(RPAREN); err != nil {
		return err
	}
	subBody := xml.StartElement{Name: xml.Name{Local: "subroutineBody"}}
	if err := e.EncodeToken(subBody); err != nil {
		return err
	}
	if err := e.Encode(s.Body); err != nil {
		return err
	}
	if err := e.EncodeToken(subBody.End()); err != nil {
		return err
	}
	return e.EncodeToken(start.End())
}

type Block struct {
	VarDecs    []VarDec
	Statements Statements
}

func (b Block) CountLocals() int {
	cnt := 0
	for _, varDec := range b.VarDecs {
		cnt += len(varDec.Names)
	}
	return cnt
}

func (b Block) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	if err := e.Encode(LBRACE); err != nil {
		return err
	}
	if err := e.Encode(b.VarDecs); err != nil {
		return err
	}
	if err := e.Encode(b.Statements); err != nil {
		return err
	}
	return e.Encode(RBRACE)
}

type ReturnStatement struct {
	Expression Expression
}

func (r ReturnStatement) statementNode() {}

func (r ReturnStatement) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	start.Name.Local = "returnStatement"
	if err := e.EncodeToken(start); err != nil {
		return err
	}
	if err := e.Encode(RETURN); err != nil {
		return err
	}
	if r.Expression != nil {
		if err := encodeExpressionXML(e, r.Expression); err != nil {
			return err
		}
	}
	if err := e.Encode(SEMICOL); err != nil {
		return err
	}
	return e.EncodeToken(start.End())
}

type IfStatement struct {
	Expression  Expression
	Consequence Block
	Alternative *Block
}

func (i IfStatement) statementNode() {}

func (i IfStatement) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	start.Name.Local = "ifStatement"
	if err := e.EncodeToken(start); err != nil {
		return err
	}
	if err := e.Encode(IF); err != nil {
		return err
	}
	if err := e.Encode(LPAREN); err != nil {
		return err
	}
	if err := encodeExpressionXML(e, i.Expression); err != nil {
		return err
	}
	if err := e.Encode(RPAREN); err != nil {
		return err
	}
	if err := e.Encode(i.Consequence); err != nil {
		return err
	}
	if i.Alternative != nil {
		if err := e.Encode(ELSE); err != nil {
			return err
		}
		if err := e.Encode(i.Alternative); err != nil {
			return err
		}
	}
	return e.EncodeToken(start.End())
}

type LetStatement struct {
	Name  Identifier
	Value Expression
	Index Expression
}

func (l LetStatement) statementNode() {}

func (l LetStatement) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	start.Name.Local = "letStatement"
	if err := e.EncodeToken(start); err != nil {
		return err
	}
	if err := e.Encode(LET); err != nil {
		return err
	}
	if err := e.Encode(l.Name); err != nil {
		return err
	}
	if l.Index != nil {
		if err := e.Encode(LBRACK); err != nil {
			return err
		}
		if err := encodeExpressionXML(e, l.Index); err != nil {
			return err
		}
		if err := e.Encode(RBRACK); err != nil {
			return err
		}
	}

	if err := e.Encode(EQ); err != nil {
		return err
	}
	if err := encodeExpressionXML(e, l.Value); err != nil {
		return err
	}
	if err := e.Encode(SEMICOL); err != nil {
		return err
	}
	return e.EncodeToken(start.End())
}

type WhileStatement struct {
	Expression Expression
	Block      Block
}

func (w WhileStatement) statementNode() {}

func (w WhileStatement) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	start.Name.Local = "whileStatement"
	if err := e.EncodeToken(start); err != nil {
		return err
	}
	if err := e.Encode(WHILE); err != nil {
		return err
	}
	if err := e.Encode(LPAREN); err != nil {
		return err
	}
	if err := encodeExpressionXML(e, w.Expression); err != nil {
		return err
	}
	if err := e.Encode(RPAREN); err != nil {
		return err
	}
	if err := e.Encode(w.Block); err != nil {
		return err
	}
	return e.EncodeToken(start.End())
}

type DoStatement struct {
	SubCall SubCall
}

func (d DoStatement) statementNode() {}

func (d DoStatement) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	start.Name.Local = "doStatement"
	if err := e.EncodeToken(start); err != nil {
		return err
	}
	if err := e.Encode(DO); err != nil {
		return err
	}
	if err := e.Encode(d.SubCall); err != nil {
		return err
	}
	if err := e.Encode(SEMICOL); err != nil {
		return err
	}
	return e.EncodeToken(start.End())
}

type VarDec struct {
	Type  Token
	Names []Identifier
}

func (v VarDec) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	start.Name.Local = "varDec"
	if err := e.EncodeToken(start); err != nil {
		return err
	}
	if err := e.Encode(VAR); err != nil {
		return err
	}
	if err := e.Encode(v.Type); err != nil {
		return err
	}
	for i, name := range v.Names {
		if i != 0 {
			if err := e.Encode(COMMA); err != nil {
				return err
			}
		}
		if err := e.Encode(name); err != nil {
			return err
		}
	}
	if err := e.Encode(SEMICOL); err != nil {
		return err
	}
	return e.EncodeToken(start.End())
}

type Parameter struct {
	Type Token
	Name Identifier
}

func (p Parameter) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	if err := e.Encode(p.Type); err != nil {
		return err
	}
	return e.Encode(p.Name)
}

type Parameters []Parameter

func (p Parameters) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	start.Name.Local = "parameterList"
	if err := e.EncodeToken(start); err != nil {
		return err
	}
	// This is a hack to pass the test. The test expects a newline after the opening tag.
	if len(p) == 0 {
		if err := e.EncodeToken(xml.CharData([]byte("\n"))); err != nil {
			return err
		}
	}
	for i, param := range p {
		if i != 0 {
			if err := e.Encode(COMMA); err != nil {
				return err
			}
		}
		if err := e.Encode(param); err != nil {
			return err
		}
	}
	return e.EncodeToken(start.End())
}

type ClassVarDec struct {
	Kind  Token
	Type  Token
	Names []Identifier
}

func (c ClassVarDec) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	start.Name.Local = "classVarDec"
	if err := e.EncodeToken(start); err != nil {
		return err
	}
	if err := e.Encode(c.Kind); err != nil {
		return err
	}
	if err := e.Encode(c.Type); err != nil {
		return err
	}
	for i, name := range c.Names {
		if i != 0 {
			if err := e.Encode(COMMA); err != nil {
				return err
			}
		}
		if err := e.Encode(name); err != nil {
			return err
		}
	}
	if err := e.Encode(SEMICOL); err != nil {
		return err
	}
	return e.EncodeToken(start.End())
}

type InfixExpression struct {
	Operator Token
	Left     Expression
	Right    Expression
}

func (i InfixExpression) expressionNode() {}

func (i InfixExpression) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	if err := e.Encode(i.Left); err != nil {
		return err
	}
	if err := encodeSymbolXML(e, string(i.Operator.Literal)); err != nil {
		return err
	}
	return e.Encode(i.Right)
}

type SubCall struct {
	Receiver  *Identifier
	Name      Identifier
	Arguments Expressions
}

func (s SubCall) expressionNode() {}

func (s SubCall) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	if s.Receiver != nil {
		if err := e.Encode(s.Receiver); err != nil {
			return err
		}
		if err := e.Encode(DOT); err != nil {
			return err
		}
	}
	if err := e.Encode(s.Name); err != nil {
		return err
	}
	if err := e.Encode(LPAREN); err != nil {
		return err
	}
	if err := e.Encode(s.Arguments); err != nil {
		return err
	}
	return e.Encode(RPAREN)
}

type BaseTerm struct {
	Expression
}

func (b BaseTerm) expressionNode() {}

func (b BaseTerm) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	start.Name.Local = "term"
	if err := e.EncodeToken(start); err != nil {
		return nil
	}
	if err := e.Encode(b.Expression); err != nil {
		return err
	}
	return e.EncodeToken(start.End())
}

type GroupedExpression struct {
	Expression Expression
}

func (g GroupedExpression) expressionNode() {}

func (g GroupedExpression) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	if err := e.Encode(LPAREN); err != nil {
		return err
	}
	if err := encodeExpressionXML(e, g.Expression); err != nil {
		return err
	}
	return e.Encode(RPAREN)
}

type PrefixExpression struct {
	Operator Token
	Right    Expression
}

func (p PrefixExpression) expressionNode() {}

func (p PrefixExpression) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	if err := encodeSymbolXML(e, string(p.Operator.Literal)); err != nil {
		return err
	}
	return e.Encode(p.Right)
}

type SubCallExpression struct {
	SubCall SubCall
}

func (s SubCallExpression) expressionNode() {}

func (s SubCallExpression) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	return e.Encode(s.SubCall)
}

type IndexExpression struct {
	Token Token
	Array Identifier
	Index Expression
}

func (i IndexExpression) expressionNode() {}

func (i IndexExpression) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	if err := e.Encode(i.Array); err != nil {
		return err
	}
	if err := e.Encode(LBRACK); err != nil {
		return err
	}
	if err := encodeExpressionXML(e, i.Index); err != nil {
		return err
	}
	return e.Encode(RBRACK)
}

type Identifier struct {
	Token
}

func (i Identifier) expressionNode() {}

func (i Identifier) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	return e.Encode(i.Token)
}

type IntegerConstant struct {
	Token Token
	Value int
}

func (i IntegerConstant) expressionNode() {}

func (i IntegerConstant) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	return e.EncodeElement(strconv.Itoa(i.Value), xml.StartElement{Name: xml.Name{Local: "integerConstant"}})
}

type StringConstant struct {
	Token Token
}

func (s StringConstant) expressionNode() {}

func (s StringConstant) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	return e.EncodeElement(s.Token.Literal, xml.StartElement{Name: xml.Name{Local: "stringConstant"}})
}

type KeywordConstant struct {
	Token Token
}

func (k KeywordConstant) expressionNode() {}

func (k KeywordConstant) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	return e.Encode(k.Token)
}

func encodeExpressionXML(e *xml.Encoder, expr Expression) error {
	elem := xml.StartElement{Name: xml.Name{Local: "expression"}}
	if err := e.EncodeToken(elem); err != nil {
		return err
	}
	if err := e.Encode(expr); err != nil {
		return err
	}
	return e.EncodeToken(elem.End())
}

func encodeSymbolXML(e *xml.Encoder, symbol string) error {
	return e.EncodeElement(symbol, xml.StartElement{Name: xml.Name{Local: "symbol"}})
}
