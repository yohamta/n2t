package main

import (
	"reflect"
	"testing"
)

func TestParseClass(t *testing.T) {
	input := `
	class Snake {
   		field int x, y; // screen location of the top-left corner of this square
		constructor Snake new(int x, int y) {
			var int z;
			let z = 5;
			return this;
		}
	}
	`
	parser := NewParser([]byte(input))
	got := parser.parseClass()
	want := Class{
		Name: Identifier{Token{TokenType: IDENTIFIER, Literal: "Snake"}},
		ClassVarDecs: []ClassVarDec{
			{Kind: Token{TokenType: FIELD, Literal: "field"},
				Type: Token{TokenType: INT, Literal: "int"},
				Names: []Identifier{
					{Token{TokenType: IDENTIFIER, Literal: "x"}},
					{Token{TokenType: IDENTIFIER, Literal: "y"}},
				},
			},
		},
		SubDecs: []SubDec{
			{
				SubType:    Token{TokenType: CONSTRUCTOR, Literal: "constructor"},
				Name:       Identifier{Token{TokenType: IDENTIFIER, Literal: "new"}},
				ReturnType: Token{TokenType: IDENTIFIER, Literal: "Snake"},
				Parameters: []Parameter{
					{Type: Token{TokenType: INT, Literal: "int"}, Name: Identifier{Token{TokenType: IDENTIFIER, Literal: "x"}}},
					{Type: Token{TokenType: INT, Literal: "int"}, Name: Identifier{Token{TokenType: IDENTIFIER, Literal: "y"}}},
				},
				Body: Block{
					VarDecs: []VarDec{
						{Type: Token{TokenType: INT, Literal: "int"},
							Names: []Identifier{
								{Token{TokenType: IDENTIFIER, Literal: "z"}}},
						},
					},
					Statements: []Statement{
						LetStatement{
							Name:  Identifier{Token{TokenType: IDENTIFIER, Literal: "z"}},
							Value: BaseTerm{IntegerConstant{Token: Token{TokenType: INTEGER, Literal: "5"}, Value: 5}},
						},
						ReturnStatement{
							Expression: BaseTerm{KeywordConstant{Token: Token{TokenType: THIS, Literal: "this"}}},
						},
					},
				},
			},
		},
	}
	testClassDec(t, got, want)
}

func TestParseSubDec(t *testing.T) {
	input := `function int getX(int z) {
		return x;
	}`
	parser := NewParser([]byte(input))
	got := parser.parseSubDec()
	want := SubDec{
		SubType:    Token{TokenType: FUNCTION, Literal: "function"},
		ReturnType: Token{TokenType: INT, Literal: "int"},
		Name:       Identifier{Token{TokenType: IDENTIFIER, Literal: "getX"}},
		Parameters: []Parameter{
			{
				Type: Token{TokenType: INT, Literal: "int"},
				Name: Identifier{Token{TokenType: IDENTIFIER, Literal: "z"}},
			},
		},
		Body: Block{
			Statements: []Statement{
				ReturnStatement{
					Expression: BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "x"}}},
				},
			},
		},
	}
	testSubroutineDec(t, got, want)
}

func TestParseBlock(t *testing.T) {
	input := `{ var int x, y; let x = 1; let y = 2; return x + y; }`
	parser := NewParser([]byte(input))
	got := parser.parseBlock()
	want := Block{
		VarDecs: []VarDec{
			{
				Type: Token{TokenType: INT, Literal: "int"},
				Names: []Identifier{
					{Token{TokenType: IDENTIFIER, Literal: "x"}},
					{Token{TokenType: IDENTIFIER, Literal: "y"}},
				},
			},
		},
		Statements: []Statement{
			LetStatement{
				Name:  Identifier{Token{TokenType: IDENTIFIER, Literal: "x"}},
				Value: BaseTerm{IntegerConstant{Token: Token{TokenType: INTEGER, Literal: "1"}, Value: 1}},
			},
			LetStatement{
				Name:  Identifier{Token{TokenType: IDENTIFIER, Literal: "y"}},
				Value: BaseTerm{IntegerConstant{Token: Token{TokenType: INTEGER, Literal: "2"}, Value: 2}},
			},
			ReturnStatement{
				Expression: InfixExpression{
					Left:     BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "x"}}},
					Operator: Token{TokenType: PLUS, Literal: "+"},
					Right:    BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "y"}}},
				},
			},
		},
	}
	testBlock(t, got, want)
}

func TestParseLet(t *testing.T) {
	tests := []struct {
		input string
		want  LetStatement
	}{
		{
			input: `let x = 5;`,
			want: LetStatement{
				Name:  Identifier{Token{TokenType: IDENTIFIER, Literal: "x"}},
				Value: BaseTerm{IntegerConstant{Token: Token{TokenType: INTEGER, Literal: "5"}, Value: 5}},
			},
		},
		{
			input: `let a[i] = x + 1;`,
			want: LetStatement{
				Name:  Identifier{Token{TokenType: IDENTIFIER, Literal: "a"}},
				Index: BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "i"}}},
				Value: InfixExpression{
					Left:     BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "x"}}},
					Operator: Token{TokenType: PLUS, Literal: "+"},
					Right:    BaseTerm{IntegerConstant{Token: Token{TokenType: INTEGER, Literal: "1"}, Value: 1}},
				},
			},
		},
		{
			input: `let a[1] = a[2];`,
			want: LetStatement{
				Name:  Identifier{Token{TokenType: IDENTIFIER, Literal: "a"}},
				Index: BaseTerm{IntegerConstant{Token: Token{TokenType: INTEGER, Literal: "1"}, Value: 1}},
				Value: BaseTerm{IndexExpression{
					Token: Token{TokenType: IDENTIFIER, Literal: "a"},
					Array: Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "a"}},
					Index: BaseTerm{IntegerConstant{Token: Token{TokenType: INTEGER, Literal: "1"}, Value: 2}},
				}},
			},
		},
	}

	for _, tt := range tests {
		t.Run(tt.input, func(t *testing.T) {
			parser := NewParser([]byte(tt.input))
			got := parser.parseLet()
			testStatement(t, got, tt.want)
		})
	}
}

func TestParseExpression(t *testing.T) {
	tests := []struct {
		input string
		want  Expression
	}{
		{"5", BaseTerm{IntegerConstant{Token: Token{TokenType: INTEGER, Literal: "5"}, Value: 5}}},
		{"true", BaseTerm{KeywordConstant{Token: Token{TokenType: TRUE, Literal: "true"}}}},
		{"false", BaseTerm{KeywordConstant{Token: Token{TokenType: FALSE, Literal: "false"}}}},
		{"null", BaseTerm{KeywordConstant{Token: Token{TokenType: NULL, Literal: "null"}}}},
		{"this", BaseTerm{KeywordConstant{Token: Token{TokenType: THIS, Literal: "this"}}}},
		{"sum", BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "sum"}}}},
		{"-x", BaseTerm{PrefixExpression{
			Operator: Token{TokenType: MINUS, Literal: "-"},
			Right:    BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "x"}}},
		}}},
		{"~y", BaseTerm{PrefixExpression{
			Operator: Token{TokenType: TILDE, Literal: "~"},
			Right:    BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "y"}}},
		}}},
		{"(a + b)", BaseTerm{GroupedExpression{
			Expression: InfixExpression{
				Left:     BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "a"}}},
				Operator: Token{TokenType: PLUS, Literal: "+"},
				Right:    BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "b"}}},
			},
		}}},
		{"a[i]", BaseTerm{IndexExpression{
			Token: Token{TokenType: IDENTIFIER, Literal: "a"},
			Array: Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "a"}},
			Index: BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "i"}}},
		}}},
		{"obj.fn(1)", BaseTerm{SubCallExpression{SubCall{
			Name:     Identifier{Token{TokenType: IDENTIFIER, Literal: "fn"}},
			Receiver: &Identifier{Token{TokenType: IDENTIFIER, Literal: "obj"}},
			Arguments: []Expression{
				BaseTerm{IntegerConstant{Token: Token{TokenType: INTEGER, Literal: "1"}, Value: 1}},
			},
		}}}},
	}

	for _, tt := range tests {
		t.Run(tt.input, func(t *testing.T) {
			parser := NewParser([]byte(tt.input))
			got := parser.parseExpression()
			testExpression(t, got, tt.want)
		})
	}
}

func TestParseStatements(t *testing.T) {
	tests := []struct {
		input string
		want  []Statement
	}{
		{
			input: `
				let x = 5;
				do print(x);
				return;
			`,
			want: []Statement{
				LetStatement{
					Name:  Identifier{Token{TokenType: IDENTIFIER, Literal: "x"}},
					Value: BaseTerm{IntegerConstant{Token: Token{TokenType: INTEGER, Literal: "5"}, Value: 5}},
				},
				DoStatement{
					SubCall: SubCall{
						Name: Identifier{Token{TokenType: IDENTIFIER, Literal: "print"}},
						Arguments: []Expression{
							BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "x"}}},
						},
					},
				},
				ReturnStatement{},
			},
		},
		{
			input: `
				if (x > 0) {
					let y = x;
				} else {
					let y = -x;
				}

				while (x < 10) {
					let x = x + 1;
				}
			`,
			want: []Statement{
				IfStatement{
					Expression: InfixExpression{
						Left:     BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "x"}}},
						Operator: Token{TokenType: GT, Literal: ">"},
						Right:    BaseTerm{IntegerConstant{Token: Token{TokenType: INTEGER, Literal: "0"}, Value: 0}},
					},
					Consequence: Block{
						Statements: []Statement{
							LetStatement{
								Name:  Identifier{Token{TokenType: IDENTIFIER, Literal: "y"}},
								Value: BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "x"}}},
							},
						},
					},
					Alternative: &Block{
						Statements: []Statement{
							LetStatement{
								Name: Identifier{Token{TokenType: IDENTIFIER, Literal: "y"}},
								Value: BaseTerm{PrefixExpression{
									Operator: Token{TokenType: MINUS, Literal: "-"},
									Right:    BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "x"}}},
								}},
							},
						},
					},
				},
				WhileStatement{
					Expression: InfixExpression{
						Left:     BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "x"}}},
						Operator: Token{TokenType: LT, Literal: "<"},
						Right:    BaseTerm{IntegerConstant{Token: Token{TokenType: INTEGER, Literal: "10"}, Value: 10}},
					},
					Block: Block{
						Statements: []Statement{
							LetStatement{
								Name: Identifier{Token{TokenType: IDENTIFIER, Literal: "x"}},
								Value: InfixExpression{
									Left:     BaseTerm{Identifier{Token: Token{TokenType: IDENTIFIER, Literal: "x"}}},
									Operator: Token{TokenType: PLUS, Literal: "+"},
									Right:    BaseTerm{IntegerConstant{Token: Token{TokenType: INTEGER, Literal: "1"}, Value: 1}},
								},
							},
						},
					},
				},
			},
		},
	}

	for _, tt := range tests {
		t.Run(tt.input, func(t *testing.T) {
			parser := NewParser([]byte(tt.input))
			got := make([]Statement, 0)
			for !parser.curTokenIs(EOF) {
				got = append(got, parser.parseStatement())
			}
			testStatements(t, got, tt.want)
		})
	}
}

func TestParse(t *testing.T) {
	input := `
		class Main {
			function void main() {
				var int x;
				let x = 1;
				return;
			}
		}
	`
	want := Class{
		Name: Identifier{Token{TokenType: IDENTIFIER, Literal: "Main"}},
		SubDecs: []SubDec{
			{
				SubType:    Token{TokenType: FUNCTION, Literal: "function"},
				ReturnType: Token{TokenType: VOID, Literal: "void"},
				Name:       Identifier{Token{TokenType: IDENTIFIER, Literal: "main"}},
				Body: Block{
					VarDecs: []VarDec{
						{
							Type:  Token{TokenType: INT, Literal: "int"},
							Names: []Identifier{{Token{TokenType: IDENTIFIER, Literal: "x"}}},
						},
					},
					Statements: []Statement{
						LetStatement{
							Name:  Identifier{Token{TokenType: IDENTIFIER, Literal: "x"}},
							Value: BaseTerm{IntegerConstant{Token: Token{TokenType: INTEGER, Literal: "1"}, Value: 1}},
						},
						ReturnStatement{},
					},
				},
			},
		},
	}
	runParserTest(t, want, NewParser([]byte(input)))
}

func runParserTest(t *testing.T, want Class, parser *Parser) {
	node, err := parser.Parse()
	if err != nil {
		t.Fatalf("unexpected error: %#v", err)
	}

	program, ok := node.(Program)
	if !ok {
		t.Fatalf("expected a Program node, got %T", node)
	}

	testClassDec(t, program.Class, want)
}

func testClassDec(t *testing.T, got, want Class) {
	t.Helper()
	if want.Name != got.Name {
		t.Errorf("expected class name %s, got %s", want.Name, got.Name)
	}
	testClassVarDecs(t, got.ClassVarDecs, want.ClassVarDecs)
	testSubroutineDecs(t, got.SubDecs, want.SubDecs)
}

func testClassVarDecs(t *testing.T, got []ClassVarDec, want []ClassVarDec) {
	t.Helper()
	if len(got) != len(want) {
		t.Fatalf("expected %d class var decs, got %d", len(want), len(got))
	}

	for i, want := range want {
		if want.Kind != got[i].Kind {
			t.Errorf("expected class var type %s, got %s", want.Kind, got[i].Kind)
		}
		if want.Type != got[i].Type {
			t.Errorf("expected class var type %s, got %s", want.Type, got[i].Type)
		}
		if len(want.Names) != len(got[i].Names) {
			t.Fatalf("expected %d class var names, got %d", len(want.Names), len(got[i].Names))
		}
		for j, want := range want.Names {
			if want != got[i].Names[j] {
				t.Errorf("expected class var name %s, got %s", want, got[i].Names[j])
			}
		}
	}
}

func testSubroutineDecs(t *testing.T, got []SubDec, want []SubDec) {
	t.Helper()
	if len(got) != len(want) {
		t.Fatalf("expected %d subroutine decs, got %d", len(want), len(got))
	}
	for i, want := range want {
		testSubroutineDec(t, got[i], want)
	}
}

func testSubroutineDec(t *testing.T, got, want SubDec) {
	t.Helper()
	if want.Name != got.Name {
		t.Errorf("expected subroutine name %s, got %s", want.Name, got.Name)
	}
	if want.SubType != got.SubType {
		t.Errorf("expected subroutine type %s, got %s", want.SubType, got.SubType)
	}
	if want.ReturnType != got.ReturnType {
		t.Errorf("expected subroutine return type %s, got %s", want.ReturnType, got.ReturnType)
	}
	testParameters(t, got.Parameters, want.Parameters)
	testVarDecs(t, got.Body.VarDecs, want.Body.VarDecs)
	testStatements(t, got.Body.Statements, want.Body.Statements)
}

func testVarDecs(t *testing.T, got, want []VarDec) {
	t.Helper()
	if len(want) != len(got) {
		t.Errorf("expected %d var decs, got %d", len(want), len(got))
	}
	for i, want := range want {
		testVarDec(t, got[i], want)
	}
}

func testParameters(t *testing.T, got, want []Parameter) {
	t.Helper()
	if len(want) != len(got) {
		t.Errorf("expected %d parameters, got %d", len(want), len(got))
	}
	for i, want := range want {
		testParameter(t, got[i], want)
	}
}

func testParameter(t *testing.T, got, want Parameter) {
	t.Helper()
	if want.Name != got.Name {
		t.Errorf("expected parameter name %s, got %s", want.Name, got.Name)
	}
	if want.Type != got.Type {
		t.Errorf("expected parameter type %s, got %s", want.Type, got.Type)
	}
}

func testVarDec(t *testing.T, got, want VarDec) {
	t.Helper()
	if want.Type != got.Type {
		t.Errorf("expected var dec type %s, got %s", want.Type, got.Type)
	}
	if len(want.Names) != len(got.Names) {
		t.Fatalf("expected %d var dec names, got %d", len(want.Names), len(got.Names))
	}
	for i, want := range want.Names {
		if want != got.Names[i] {
			t.Errorf("expected var dec name %s, got %s", want, got.Names[i])
		}
	}
}

func testStatements(t *testing.T, got, want []Statement) {
	t.Helper()
	if len(got) != len(want) {
		t.Fatalf("expected %d statements, got %d", len(want), len(got))
	}
	for i, want := range want {
		testStatement(t, got[i], want)
	}
}

func testStatement(t *testing.T, got, want Statement) {
	t.Helper()
	switch want := want.(type) {
	case LetStatement:
		testLetStatement(t, got.(LetStatement), want)
	case IfStatement:
		testIfStatement(t, got.(IfStatement), want)
	case ReturnStatement:
		testReturnStatement(t, got.(ReturnStatement), want)
	case WhileStatement:
		testWhileStatement(t, got.(WhileStatement), want)
	case DoStatement:
		testDoStatement(t, got.(DoStatement), want)
	}
}

func testLetStatement(t *testing.T, got, want LetStatement) {
	t.Helper()
	if want.Name != got.Name {
		t.Errorf("expected let statement var name %s, got %s", want.Name, got.Name)
	}
	testExpression(t, got.Value, want.Value)
}

func testIfStatement(t *testing.T, got, want IfStatement) {
	t.Helper()
	testExpression(t, got.Expression, want.Expression)
	testBlock(t, got.Consequence, want.Consequence)
}

func testBlock(t *testing.T, got, want Block) {
	t.Helper()
	testVarDecs(t, got.VarDecs, want.VarDecs)
	testStatements(t, got.Statements, want.Statements)
}

func testReturnStatement(t *testing.T, got, want ReturnStatement) {
	t.Helper()
	testExpression(t, got.Expression, want.Expression)
}

func testWhileStatement(t *testing.T, got, want WhileStatement) {
	t.Helper()
	testExpression(t, got.Expression, want.Expression)
	testBlock(t, got.Block, want.Block)
}

func testDoStatement(t *testing.T, got, want DoStatement) {
	t.Helper()
	testSubCall(t, got.SubCall, want.SubCall)
}

func testExpressions(t *testing.T, got, want []Expression) {
	t.Helper()
	if len(want) != len(got) {
		t.Fatalf("expected %d expressions, got %d", len(want), len(got))
	}
	for i, want := range want {
		testExpression(t, got[i], want)
	}
}

func testExpression(t *testing.T, got, want Expression) {
	t.Helper()
	if (got == nil) != (want == nil) {
		t.Fatalf("expected expression %#v, got %#v", want, got)
	}
	switch want := want.(type) {
	case Identifier:
		testToken(t, got.(Identifier).Token, want.Token)
	case IntegerConstant:
		testIntegerConstant(t, got.(IntegerConstant), want)
	case StringConstant:
		testToken(t, got.(StringConstant).Token, want.Token)
	case KeywordConstant:
		testToken(t, got.(KeywordConstant).Token, want.Token)
	case InfixExpression:
		testInfixExpression(t, got.(InfixExpression), want)
	case PrefixExpression:
		testUnaryExpression(t, got.(PrefixExpression), want)
	case SubCallExpression:
		testSubCall(t, got.(SubCallExpression).SubCall, want.SubCall)
	case GroupedExpression:
		testExpression(t, got.(GroupedExpression).Expression, want.Expression)
	case BaseTerm:
		testExpression(t, got.(BaseTerm).Expression, want.Expression)
	default:
		if reflect.TypeOf(got) != reflect.TypeOf(want) {
			t.Fatalf("expected expression type %T, got %T", want, got)
		}
	}
}

func testIntegerConstant(t *testing.T, got, want IntegerConstant) {
	t.Helper()
	if want.Value != got.Value {
		t.Errorf("expected integer constant value %d, got %d", want.Value, got.Value)
	}
}

func testToken(t *testing.T, got, want Token) {
	t.Helper()
	if want != got {
		t.Errorf("expected token %v, got %v", want, got)
	}
}

func testUnaryExpression(t *testing.T, got, want PrefixExpression) {
	t.Helper()
	if want.Operator.TokenType != got.Operator.TokenType {
		t.Errorf("expected unary expression operator %s, got %s", want.Operator.TokenType, got.Operator.TokenType)
	}
	if want.Operator.Literal != got.Operator.Literal {
		t.Errorf("expected unary expression operator %s, got %s", want.Operator.Literal, got.Operator.Literal)
	}
	testExpression(t, got.Right, want.Right)
}

func testInfixExpression(t *testing.T, got, want InfixExpression) {
	t.Helper()
	if want.Operator.TokenType != got.Operator.TokenType {
		t.Errorf("expected infix expression operator %s, got %s", want.Operator.TokenType, got.Operator.TokenType)
	}
	if want.Operator.Literal != got.Operator.Literal {
		t.Errorf("expected infix expression operator %s, got %s", want.Operator.Literal, got.Operator.Literal)
	}
	testExpression(t, got.Left, want.Left)
	testExpression(t, got.Right, want.Right)
}

func testSubCall(t *testing.T, got, want SubCall) {
	t.Helper()
	if want.Name != got.Name {
		t.Errorf("expected sub call name %s, got %s", want.Name, got.Name)
	}
	if (want.Receiver == nil) != (got.Receiver == nil) {
		t.Errorf("expected sub call receiver %#v, got %#v", want.Receiver, got.Receiver)
	} else if want.Receiver != nil && got.Receiver != nil && *want.Receiver != *got.Receiver {
		t.Errorf("expected sub call receiver %#v, got %#v", want.Receiver, got.Receiver)
	}
	testExpressions(t, got.Arguments, want.Arguments)
}
