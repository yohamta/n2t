package main

import (
	"testing"
)

func TestAdvance_Tokenizer(t *testing.T) {
	input := `
	class Snake {
		field int x, y, z;
		// comment
		constructor Snake new(int x, int y) {
		   let z = 100;
		   let x = "string";
		   return this;
		}
	}
	/** 
		multi-line comment
	*/
	/** single-line comment */
	if (x < 0) {
		let sign = "negative";
	}
	`
	lexer := NewTokenizer([]byte(input))

	tests := []Token{
		{TokenType: CLASS, Literal: "class"},
		{TokenType: IDENTIFIER, Literal: "Snake"},
		{TokenType: LBRACE, Literal: "{"},
		{TokenType: FIELD, Literal: "field"},
		{TokenType: INT, Literal: "int"},
		{TokenType: IDENTIFIER, Literal: "x"},
		{TokenType: COMMA, Literal: ","},
		{TokenType: IDENTIFIER, Literal: "y"},
		{TokenType: COMMA, Literal: ","},
		{TokenType: IDENTIFIER, Literal: "z"},
		{TokenType: SEMICOL, Literal: ";"},
		{TokenType: CONSTRUCTOR, Literal: "constructor"},
		{TokenType: IDENTIFIER, Literal: "Snake"},
		{TokenType: IDENTIFIER, Literal: "new"},
		{TokenType: LPAREN, Literal: "("},
		{TokenType: INT, Literal: "int"},
		{TokenType: IDENTIFIER, Literal: "x"},
		{TokenType: COMMA, Literal: ","},
		{TokenType: INT, Literal: "int"},
		{TokenType: IDENTIFIER, Literal: "y"},
		{TokenType: RPAREN, Literal: ")"},
		{TokenType: LBRACE, Literal: "{"},
		{TokenType: LET, Literal: "let"},
		{TokenType: IDENTIFIER, Literal: "z"},
		{TokenType: EQ, Literal: "="},
		{TokenType: INTEGER, Literal: "100"},
		{TokenType: SEMICOL, Literal: ";"},
		{TokenType: LET, Literal: "let"},
		{TokenType: IDENTIFIER, Literal: "x"},
		{TokenType: EQ, Literal: "="},
		{TokenType: STRING, Literal: "string"},
		{TokenType: SEMICOL, Literal: ";"},
		{TokenType: RETURN, Literal: "return"},
		{TokenType: THIS, Literal: "this"},
		{TokenType: SEMICOL, Literal: ";"},
		{TokenType: RBRACE, Literal: "}"},
		{TokenType: RBRACE, Literal: "}"},
		{TokenType: IF, Literal: "if"},
		{TokenType: LPAREN, Literal: "("},
		{TokenType: IDENTIFIER, Literal: "x"},
		{TokenType: LT, Literal: "<"},
		{TokenType: INTEGER, Literal: "0"},
		{TokenType: RPAREN, Literal: ")"},
		{TokenType: LBRACE, Literal: "{"},
		{TokenType: LET, Literal: "let"},
		{TokenType: IDENTIFIER, Literal: "sign"},
		{TokenType: EQ, Literal: "="},
		{TokenType: STRING, Literal: "negative"},
		{TokenType: SEMICOL, Literal: ";"},
		{TokenType: RBRACE, Literal: "}"},
	}

	for _, want := range tests {
		tk := lexer.Advance()
		if tk != want {
			t.Errorf("expected %#v, got %#v", want, tk)
		}
	}

	if lexer.HasMoreTokens() {
		t.Errorf("expected no more tokens")
	}
}
