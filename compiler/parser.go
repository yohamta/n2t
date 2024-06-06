package main

import (
	"fmt"
	"strings"
)

var (
	ErrNoMoreTokens = fmt.Errorf("no more tokens")
)

type Parser struct {
	tokenizer      *Tokenizer
	curToken       Token
	peekToken      Token
	program        Program
	prefixParseFns map[TokenType]func() Expression
	infixParseFns  map[TokenType]func(Expression) Expression
	errs           []string
}

func NewParser(program []byte) *Parser {
	p := &Parser{
		tokenizer:      NewTokenizer(program),
		prefixParseFns: map[TokenType]func() Expression{},
		infixParseFns:  map[TokenType]func(Expression) Expression{},
		program:        Program{},
	}

	p.registerInfixParseFn(PLUS, p.parseInfixExpression)
	p.registerInfixParseFn(MINUS, p.parseInfixExpression)
	p.registerInfixParseFn(ASTER, p.parseInfixExpression)
	p.registerInfixParseFn(SLASH, p.parseInfixExpression)
	p.registerInfixParseFn(AND, p.parseInfixExpression)
	p.registerInfixParseFn(PIPE, p.parseInfixExpression)
	p.registerInfixParseFn(LT, p.parseInfixExpression)
	p.registerInfixParseFn(GT, p.parseInfixExpression)
	p.registerInfixParseFn(EQ, p.parseInfixExpression)

	p.registerPrefixParseFn(INTEGER, p.parseInteger)
	p.registerPrefixParseFn(STRING, p.parseString)
	p.registerPrefixParseFn(TRUE, p.parseKeyword)
	p.registerPrefixParseFn(FALSE, p.parseKeyword)
	p.registerPrefixParseFn(NULL, p.parseKeyword)
	p.registerPrefixParseFn(THIS, p.parseKeyword)
	p.registerPrefixParseFn(IDENTIFIER, p.parseIdentifier)
	p.registerPrefixParseFn(LPAREN, p.parseGroupedExpression)
	p.registerPrefixParseFn(MINUS, p.parsePrefixExpression)
	p.registerPrefixParseFn(TILDE, p.parsePrefixExpression)

	p.nextToken()
	p.nextToken()

	return p
}

func (p *Parser) Parse() (Node, error) {
	for p.tokenizer.HasMoreTokens() {
		if p.curTokenIs(CLASS) {
			p.program.Class = p.parseClass()
			p.nextToken()
			continue
		}
		msg := fmt.Sprintf("unexpected keyword: %q at line %s", p.curToken.Literal, p.tokenizer.Line())
		p.errs = append(p.errs, msg)
		break
	}
	return p.program, p.errors()
}

func (p *Parser) Program() Program {
	return p.program
}

func (p *Parser) nextToken() Token {
	curToken := p.curToken
	p.curToken = p.peekToken
	if !p.tokenizer.HasMoreTokens() {
		p.peekToken = Token{TokenType: EOF}
		return curToken
	}
	p.peekToken = p.tokenizer.Advance()
	return curToken
}

func (p *Parser) errors() error {
	if len(p.errs) == 0 {
		return nil
	}
	return fmt.Errorf("errors: %s", strings.Join(p.errs, "\n"))
}

func (p *Parser) expectIdentifier() Identifier {
	if !p.curTokenIs(IDENTIFIER) {
		msg := fmt.Sprintf("expected identifier, got %q at line %s", p.curToken.Literal, p.tokenizer.Line())
		p.errs = append(p.errs, msg)
	}
	return Identifier{p.nextToken()}
}

func (p *Parser) expect(t TokenType) {
	if p.curToken.TokenType != t {
		p.expectError(t)
	}
	p.nextToken()
}

func (p *Parser) expectError(t TokenType) {
	msg := fmt.Sprintf("expected %q, got %q at line %s", t, p.curToken.Literal, p.tokenizer.Line())
	p.errs = append(p.errs, msg)
}

func (p *Parser) parseClass() Class {
	p.nextToken()
	cls := Class{Name: p.expectIdentifier()}
	p.expect(LBRACE)
	for !p.curTokenIs(RBRACE) && !p.curTokenIs(EOF) {
		switch p.curToken.TokenType {
		case FIELD, STATIC:
			cls.ClassVarDecs = append(cls.ClassVarDecs, p.parseClassVarDec())
		case CONSTRUCTOR, FUNCTION, METHOD:
			cls.SubDecs = append(cls.SubDecs, p.parseSubDec())
		default:
			msg := fmt.Sprintf("unexpected keyword: %q at line %s", p.curToken.Literal, p.tokenizer.Line())
			p.errs = append(p.errs, msg)
			p.nextToken()
		}
	}
	p.expect(RBRACE)
	return cls
}

func (p *Parser) parseSubDec() SubDec {
	return SubDec{
		SubType:    p.nextToken(),
		ReturnType: p.nextToken(),
		Name:       p.expectIdentifier(),
		Parameters: p.parseParameters(),
		Body:       p.parseBlock(),
	}
}

func (p *Parser) parseBlock() Block {
	p.expect(LBRACE)
	var block Block
	for p.curTokenIs(VAR) && !p.curTokenIs(EOF) {
		block.VarDecs = append(block.VarDecs, p.parseVarDec())
		p.nextToken()
	}
	for !p.curTokenIs(RBRACE) && !p.curTokenIs(EOF) {
		block.Statements = append(block.Statements, p.parseStatement())
	}
	p.expect(RBRACE)
	return block
}

func (p *Parser) parseLet() Statement {
	p.expect(LET)
	stmt := LetStatement{Name: p.expectIdentifier()}
	if p.curTokenIs(LBRACK) {
		p.nextToken()
		stmt.Index = p.parseExpression()
		p.expect(RBRACK)
	}
	p.expect(EQ)
	stmt.Value = p.parseExpression()
	p.expect(SEMICOL)
	return stmt
}

func (p *Parser) parseExpression() Expression {
	prefix := p.prefixParseFns[p.curToken.TokenType]
	if prefix == nil {
		msg := fmt.Sprintf("unexpected keyword: %q at line %s", p.curToken.Literal, p.tokenizer.Line())
		p.errs = append(p.errs, msg)
		return nil
	}
	left := prefix()
	if _, ok := p.infixParseFns[p.curToken.TokenType]; ok {
		left = p.infixParseFns[p.curToken.TokenType](left)
	}
	return left
}

func (p *Parser) parsePrefixExpression() Expression {
	return BaseTerm{PrefixExpression{Operator: p.nextToken(), Right: p.parseExpression()}}
}

func (p *Parser) parseInteger() Expression {
	val, err := p.curToken.Int()
	if err != nil {
		msg := fmt.Sprintf("unexpected integer: %q at line %s", p.curToken.Literal, p.tokenizer.Line())
		p.errs = append(p.errs, msg)
	}

	return BaseTerm{IntegerConstant{Token: p.nextToken(), Value: val}}
}

func (p *Parser) parseString() Expression {
	return BaseTerm{StringConstant{Token: p.nextToken()}}
}

func (p *Parser) parseKeyword() Expression {
	return BaseTerm{KeywordConstant{Token: p.nextToken()}}
}

func (p *Parser) parseIdentifier() Expression {
	if p.peekTokenIs(LBRACK) {
		expr := IndexExpression{Token: p.curToken, Array: p.expectIdentifier()}
		p.expect(LBRACK)
		expr.Index = p.parseExpression()
		p.expect(RBRACK)
		return BaseTerm{expr}
	} else if p.peekTokenIs(LPAREN) || p.peekTokenIs(DOT) {
		return BaseTerm{SubCallExpression{p.parseSubCall()}}
	}
	return BaseTerm{p.expectIdentifier()}
}

func (p *Parser) parseGroupedExpression() Expression {
	p.expect(LPAREN)
	expr := p.parseExpression()
	p.expect(RPAREN)
	return BaseTerm{GroupedExpression{Expression: expr}}
}

func (p *Parser) parseInfixExpression(left Expression) Expression {
	tok := p.nextToken()
	return InfixExpression{Left: left, Operator: tok, Right: p.parseExpression()}
}

func (p *Parser) parseSubCall() SubCall {
	name := p.expectIdentifier()
	if p.curTokenIs(DOT) {
		p.nextToken()
		return SubCall{
			Receiver:  &name,
			Name:      p.expectIdentifier(),
			Arguments: p.parseExpressionList(),
		}
	}
	return SubCall{Name: name, Arguments: p.parseExpressionList()}
}

func (p *Parser) parseExpressionList() []Expression {
	var expressions []Expression
	p.expect(LPAREN)
	for !p.curTokenIs(RPAREN) && !p.curTokenIs(EOF) {
		if len(expressions) > 0 {
			p.expect(COMMA)
		}
		expressions = append(expressions, p.parseExpression())
	}
	p.expect(RPAREN)
	return expressions
}

func (p *Parser) parseStatement() Statement {
	switch p.curToken.TokenType {
	case LET:
		return p.parseLet()
	case IF:
		return p.parseIf()
	case WHILE:
		return p.parseWhile()
	case DO:
		return p.parseDo()
	case RETURN:
		return p.parseReturn()
	default:
		msg := fmt.Sprintf("unexpected keyword: %q at line %s", p.curToken.Literal, p.tokenizer.Line())
		p.errs = append(p.errs, msg)
		p.skipToToken(SEMICOL)
		p.nextToken()
		return nil
	}
}

func (p *Parser) parseParameters() []Parameter {
	var parameters []Parameter
	p.expect(LPAREN)
	for !p.curTokenIs(RPAREN) && !p.curTokenIs(EOF) {
		if len(parameters) > 0 {
			p.expect(COMMA)
		}
		parameters = append(parameters, Parameter{
			Type: p.nextToken(),
			Name: p.expectIdentifier(),
		})
	}
	p.expect(RPAREN)
	return parameters
}

func (p *Parser) parseIf() Statement {
	p.expect(IF)
	p.expect(LPAREN)
	stmt := IfStatement{Expression: p.parseExpression()}
	p.expect(RPAREN)
	stmt.Consequence = p.parseBlock()
	if p.curTokenIs(ELSE) {
		p.nextToken()
		block := p.parseBlock()
		stmt.Alternative = &block
	}
	return stmt
}

func (p *Parser) parseReturn() Statement {
	p.expect(RETURN)
	if p.curTokenIs(SEMICOL) {
		p.nextToken()
		return ReturnStatement{}
	}
	expr := p.parseExpression()
	p.expect(SEMICOL)
	return ReturnStatement{Expression: expr}
}

func (p *Parser) parseDo() Statement {
	p.expect(DO)
	subCall := p.parseSubCall()
	p.expect(SEMICOL)
	return DoStatement{SubCall: subCall}
}

func (p *Parser) parseWhile() Statement {
	p.expect(WHILE)
	p.expect(LPAREN)
	expr := p.parseExpression()
	p.expect(RPAREN)
	return WhileStatement{
		Expression: expr,
		Block:      p.parseBlock(),
	}
}

func (p *Parser) parseVarDec() VarDec {
	p.expect(VAR)
	typ := p.nextToken()
	varDecs := VarDec{Type: typ}
	for {
		varDecs.Names = append(varDecs.Names, p.expectIdentifier())
		if !p.curTokenIs(COMMA) {
			break
		}
		p.nextToken()
	}
	return varDecs
}

func (p *Parser) parseClassVarDec() ClassVarDec {
	classVarDecs := ClassVarDec{Kind: p.nextToken(), Type: p.nextToken()}
	for {
		classVarDecs.Names = append(classVarDecs.Names, p.expectIdentifier())
		if !p.curTokenIs(COMMA) {
			break
		}
		p.nextToken()
	}
	p.expect(SEMICOL)
	return classVarDecs
}

func (p *Parser) skipToToken(t TokenType) {
	for !p.curTokenIs(t) && !p.curTokenIs(EOF) {
		p.nextToken()
	}
}

func (p *Parser) curTokenIs(t TokenType) bool {
	return p.curToken.TokenType == t
}

func (p *Parser) peekTokenIs(t TokenType) bool {
	return p.peekToken.TokenType == t
}

func (p *Parser) registerInfixParseFn(t TokenType, fn func(Expression) Expression) {
	p.infixParseFns[t] = fn
}

func (p *Parser) registerPrefixParseFn(t TokenType, fn func() Expression) {
	p.prefixParseFns[t] = fn
}
