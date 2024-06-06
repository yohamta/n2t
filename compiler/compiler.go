package main

import (
	"fmt"
)

type Compiler struct {
	class       Class
	writer      *VMWriter
	symbolTable *SymbolTable
	ifIndex     int
	whileIndex  int
}

func NewCompiler() *Compiler {
	return &Compiler{
		writer:      NewVMWriter(),
		symbolTable: NewSymbolTable(S_CLASS),
	}
}

func (c *Compiler) Compile(node Node) ([]byte, error) {
	switch n := node.(type) {
	case Program:
		return c.Compile(n.Class)
	case Class:
		c.class = n
		if err := c.compileClass(n); err != nil {
			return nil, err
		}
	case Statement:
		if err := c.compileStatement(n); err != nil {
			return nil, err
		}
	case Expression:
		if err := c.compileExpression(n); err != nil {
			return nil, err
		}
	}
	return c.writer.buf.Bytes(), nil
}

func (c *Compiler) compileBlock(node Block) error {
	for _, varDec := range node.VarDecs {
		for _, name := range varDec.Names {
			c.symbolTable.Define(name.Literal, varDec.Type.Literal, S_VAR)
		}
	}
	for _, stmt := range node.Statements {
		if err := c.compileStatement(stmt); err != nil {
			return err
		}
	}
	return nil
}

func (c *Compiler) compileStatement(node Statement) error {
	switch n := node.(type) {
	case LetStatement:
		return c.compileLetStatement(n)
	case IfStatement:
		return c.compileIfStatement(n)
	case WhileStatement:
		return c.compileWhileStatement(n)
	case DoStatement:
		return c.compileDoStatement(n)
	case ReturnStatement:
		return c.returnStatement(n)
	default:
		return fmt.Errorf("unexpected statement: %v", node)
	}
}

func (c *Compiler) returnStatement(node ReturnStatement) error {
	if node.Expression == nil {
		c.writer.writePush(VM_CONST, 0)
	} else {
		if err := c.compileExpression(node.Expression); err != nil {
			return err
		}
	}
	c.writer.writeReturn()
	return nil
}

func (c *Compiler) compileDoStatement(node DoStatement) error {
	if err := c.compileSubCall(node.SubCall); err != nil {
		return err
	}
	c.writer.writePop(VM_TEMP, 0)
	return nil
}

func (c *Compiler) compileWhileStatement(node WhileStatement) error {
	whileExp, whileEnd := c.nextWhileLabels()
	c.writer.writeLabel(whileExp)
	if err := c.compileExpression(node.Expression); err != nil {
		return err
	}
	c.writer.writeArithmetic(VM_NOT)
	c.writer.writeIf(whileEnd)
	if err := c.compileBlock(node.Block); err != nil {
		return err
	}
	c.writer.writeGoto(whileExp)
	c.writer.writeLabel(whileEnd)
	return nil
}

func (c *Compiler) compileIfStatement(node IfStatement) error {
	ifFalse, ifEnd := c.nextIfLabels()
	if err := c.compileExpression(node.Expression); err != nil {
		return err
	}
	c.writer.writeArithmetic(VM_NOT)
	c.writer.writeIf(ifFalse)
	if err := c.compileBlock(node.Consequence); err != nil {
		return err
	}
	c.writer.writeGoto(ifEnd)
	c.writer.writeLabel(ifFalse)
	if node.Alternative != nil {
		if err := c.compileBlock(*node.Alternative); err != nil {
			return err
		}
	}
	c.writer.writeLabel(ifEnd)
	return nil
}

func (c *Compiler) compileExpression(node Expression) error {
	switch n := node.(type) {
	case BaseTerm:
		return c.compileExpression(n.Expression)
	case InfixExpression:
		return c.compileInfixExpression(n)
	case IntegerConstant:
		return c.compileInteger(n)
	case IndexExpression:
		return c.compileIndexExpression(n)
	case PrefixExpression:
		return c.compilePrefixExpression(n)
	case GroupedExpression:
		return c.compileExpression(n.Expression)
	case SubCallExpression:
		return c.compileSubCall(n.SubCall)
	case KeywordConstant:
		return c.compileKeyword(n)
	case StringConstant:
		return c.compileString(n)
	case Identifier:
		return c.compileIdentifier(n)
	default:
		return fmt.Errorf("unexpected expression: %#v", n)
	}
}

func (c *Compiler) compileIdentifier(node Identifier) error {
	idx, ok := c.symbolTable.IndexOf(node.Token.Literal)
	if !ok {
		return fmt.Errorf("undefined symbol: %s", node.Token.Literal)
	}
	switch c.symbolTable.KindOf(node.Token.Literal) {
	case S_STATIC:
		c.writer.writePush(VM_STATIC, idx)
	case S_VAR:
		c.writer.writePush(VM_LOCAL, idx)
	case S_FIELD:
		c.writer.writePush(VM_THIS, idx)
	case S_ARG:
		c.writer.writePush(VM_ARG, idx)
	default:
		return fmt.Errorf("unexpected kind: %#v", c.symbolTable.KindOf(node.Token.Literal))
	}
	return nil
}

func (c *Compiler) compileString(node StringConstant) error {
	c.writer.writePush(VM_CONST, len(node.Token.Literal))
	c.writer.writeCall("String", "new", 1)
	for _, r := range node.Token.Literal {
		c.writer.writePush(VM_CONST, int(r))
		c.writer.writeCall("String", "appendChar", 2)
	}
	return nil
}

func (c *Compiler) compileKeyword(node KeywordConstant) error {
	switch node.Token.TokenType {
	case NULL:
		c.writer.writePush(VM_CONST, 0)
	case TRUE:
		c.writer.writePush(VM_CONST, 0)
		c.writer.writeArithmetic(VM_NOT)
	case FALSE:
		c.writer.writePush(VM_CONST, 0)
	case THIS:
		c.writer.writePush(VM_POINTER, 0)
	default:
		return fmt.Errorf("unexpected keyword: %v", node.Token.TokenType)
	}
	return nil
}

func (c *Compiler) compileInteger(node IntegerConstant) error {
	c.writer.writePush(VM_CONST, node.Value)
	return nil
}

func (c *Compiler) compilePrefixExpression(node PrefixExpression) error {
	if err := c.compileExpression(node.Right); err != nil {
		return err
	}
	switch node.Operator.TokenType {
	case MINUS:
		c.writer.writeArithmetic(VM_NEG)
	case TILDE:
		c.writer.writeArithmetic(VM_NOT)
	default:
		return fmt.Errorf("unexpected operator: %v", node.Operator.TokenType)
	}
	return nil
}

func (c *Compiler) compileInfixExpression(node InfixExpression) error {
	if err := c.compileExpression(node.Left); err != nil {
		return err
	}
	if err := c.compileExpression(node.Right); err != nil {
		return err
	}
	switch node.Operator.TokenType {
	case PLUS:
		c.writer.writeArithmetic(VM_ADD)
	case MINUS:
		c.writer.writeArithmetic(VM_SUB)
	case EQ:
		c.writer.writeArithmetic(VM_EQ)
	case GT:
		c.writer.writeArithmetic(VM_GT)
	case LT:
		c.writer.writeArithmetic(VM_LT)
	case AND:
		c.writer.writeArithmetic(VM_AND)
	case PIPE:
		c.writer.writeArithmetic(VM_OR)
	case ASTER:
		c.writer.writeCall("Math", "multiply", 2)
	case SLASH:
		c.writer.writeCall("Math", "divide", 2)
	default:
		return fmt.Errorf("unexpected operator: %v", node.Operator.TokenType)
	}
	return nil
}

func (c *Compiler) compileSubCallWithReceiver(node SubCall, receiver *Identifier) error {
	if err := c.compileIdentifier(*receiver); err != nil {
		return err
	}
	if err := c.compileExpressions(node.Arguments); err != nil {
		return err
	}
	typ, ok := c.symbolTable.TypeOf(receiver.Literal)
	if !ok {
		return fmt.Errorf("undefined symbol: %s", receiver.Literal)
	}
	c.writer.writeCall(typ, node.Name.Literal, len(node.Arguments)+1)
	return nil
}

func (c *Compiler) compileSubCallNoReceiver(node SubCall) error {
	c.writer.writePush(VM_POINTER, 0)
	if err := c.compileExpressions(node.Arguments); err != nil {
		return err
	}
	c.writer.writeCall(c.class.Name.Literal, node.Name.Literal, len(node.Arguments)+1)
	return nil
}

func (c *Compiler) compileSubCall(node SubCall) error {
	switch {
	case node.Receiver != nil && c.symbolTable.KindOf(node.Receiver.Literal) == S_NONE:
		if err := c.compileExpressions(node.Arguments); err != nil {
			return err
		}
		c.writer.writeCall(node.Receiver.Literal, node.Name.Literal, len(node.Arguments))
	case node.Receiver != nil:
		if err := c.compileSubCallWithReceiver(node, node.Receiver); err != nil {
			return err
		}
	default:
		if c.symbolTable.scope == S_FUNCTION {
			return fmt.Errorf("unexpected sub call without receiver in function")
		}
		if err := c.compileSubCallNoReceiver(node); err != nil {
			return err
		}
	}
	return nil
}

func (c *Compiler) compileExpressions(nodes Expressions) error {
	for _, arg := range nodes {
		if err := c.compileExpression(arg); err != nil {
			return err
		}
	}
	return nil
}

func (c *Compiler) compileIndexExpression(node IndexExpression) error {
	if err := c.compileExpression(node.Index); err != nil {
		return err
	}
	if err := c.compileIdentifier(node.Array); err != nil {
		return err
	}
	c.writer.writeArithmetic(VM_ADD)
	c.writer.writePop(VM_POINTER, 1)
	c.writer.writePush(VM_THAT, 0)
	return nil
}

func (c *Compiler) compileLetStatementWithIndex(node LetStatement) error {
	if err := c.compileExpression(node.Index); err != nil {
		return err
	}
	if err := c.compileIdentifier(node.Name); err != nil {
		return err
	}
	c.writer.writeArithmetic(VM_ADD)
	if err := c.compileExpression(node.Value); err != nil {
		return err
	}
	c.writer.writePop(VM_TEMP, 0)
	c.writer.writePop(VM_POINTER, 1)
	c.writer.writePush(VM_TEMP, 0)
	c.writer.writePop(VM_THAT, 0)
	return nil
}

func (c *Compiler) compileLetStatementNoIndex(node LetStatement) error {
	if err := c.compileExpression(node.Value); err != nil {
		return err
	}
	return c.compileIdentifierPop(node.Name.Literal)
}

func (c *Compiler) compileLetStatement(node LetStatement) error {
	if node.Index != nil {
		return c.compileLetStatementWithIndex(node)
	}
	return c.compileLetStatementNoIndex(node)
}

func (c *Compiler) compileIdentifierPop(name string) error {
	idx, ok := c.symbolTable.IndexOf(name)
	if !ok {
		return fmt.Errorf("undefined symbol: %s", name)
	}
	switch c.symbolTable.KindOf(name) {
	case S_STATIC:
		c.writer.writePop(VM_STATIC, idx)
	case S_VAR:
		c.writer.writePop(VM_LOCAL, idx)
	case S_FIELD:
		c.writer.writePop(VM_THIS, idx)
	case S_ARG:
		c.writer.writePop(VM_ARG, idx)
	default:
		return fmt.Errorf("unexpected kind: %#v", c.symbolTable.KindOf(name))
	}
	return nil
}

func (c *Compiler) compileClass(node Class) error {
	for _, field := range node.ClassVarDecs {
		for _, name := range field.Names {
			switch field.Kind.TokenType {
			case STATIC:
				c.symbolTable.Define(name.Literal, field.Type.Literal, S_STATIC)
			case FIELD:
				c.symbolTable.Define(name.Literal, field.Type.Literal, S_FIELD)
			default:
				return fmt.Errorf("unexpected field kind: %v", field.Kind.TokenType)
			}
		}
	}
	for _, sub := range node.SubDecs {
		if err := c.compileSubDec(sub); err != nil {
			return err
		}
	}
	return nil
}

func (c *Compiler) enterScope(scope Scope) {
	c.symbolTable = NewSubSymbolTable(c.symbolTable, scope)
}

func (c *Compiler) leaveScope() {
	c.symbolTable = c.symbolTable.outer
}

func (c *Compiler) compileSubDec(sub SubDec) error {
	c.writer.writeFunction(c.class.Name.Literal, sub.Name.Literal, sub.Body.CountLocals())
	switch sub.SubType.TokenType {
	case CONSTRUCTOR:
		c.enterScope(S_CONSTRUCTOR)
		for _, param := range sub.Parameters {
			c.symbolTable.Define(param.Name.Literal, param.Type.Literal, S_ARG)
		}
		c.writer.writePush(VM_CONST, c.class.FieldLen())
		c.writer.writeCall("Memory", "alloc", 1)
		c.writer.writePop(VM_POINTER, 0)
	case FUNCTION:
		c.enterScope(S_FUNCTION)
		for _, param := range sub.Parameters {
			c.symbolTable.Define(param.Name.Literal, param.Type.Literal, S_ARG)
		}
	case METHOD:
		c.enterScope(S_METHOD)
		c.symbolTable.Define("this", c.class.Name.Literal, S_ARG)
		for _, param := range sub.Parameters {
			c.symbolTable.Define(param.Name.Literal, param.Type.Literal, S_ARG)
		}
		c.writer.writePush(VM_ARG, 0)
		c.writer.writePop(VM_POINTER, 0)
	default:
		return fmt.Errorf("unexpected sub type: %v", sub.SubType.TokenType)
	}
	if err := c.compileBlock(sub.Body); err != nil {
		return err
	}
	c.leaveScope()
	return nil
}

func (c *Compiler) nextIfLabels() (string, string) {
	idx := c.ifIndex
	c.ifIndex++
	return fmt.Sprintf("IF_FALSE%d", idx), fmt.Sprintf("IF_END%d", idx)
}

func (c *Compiler) nextWhileLabels() (string, string) {
	idx := c.whileIndex
	c.whileIndex++
	return fmt.Sprintf("WHILE_EXP%d", idx), fmt.Sprintf("WHILE_END%d", idx)
}
