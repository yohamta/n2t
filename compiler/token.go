package main

import (
	"encoding/xml"
	"strconv"
	"strings"
)

type Token struct {
	TokenType TokenType
	Literal   string
}

func (t Token) Int() (int, error) {
	v, err := strconv.Atoi(t.Literal)
	return int(v), err
}

func (t Token) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	switch {
	case t.IsKeyword():
		start.Name.Local = "keyword"
	case t.TokenType == IDENTIFIER:
		start.Name.Local = "identifier"
	default:
		start.Name.Local = "symbol"
	}
	return e.EncodeElement(t.Literal, start)
}

func (t Token) IsKeyword() bool {
	_, ok := keywords[t.Literal]
	return ok
}

type TokenType string

func (t TokenType) MarshalXML(e *xml.Encoder, start xml.StartElement) error {
	lower := strings.ToLower(string(t))
	if _, ok := keywords[lower]; ok {
		start.Name.Local = "keyword"
		return e.EncodeElement(lower, start)
	}
	start.Name.Local = "symbol"
	return e.EncodeElement(lower, start)
}

func newToken(tokenType TokenType, ch byte) Token {
	return Token{TokenType: tokenType, Literal: string(ch)}
}

const (
	// symbols
	LBRACE  TokenType = "{"
	RBRACE  TokenType = "}"
	LPAREN  TokenType = "("
	RPAREN  TokenType = ")"
	LBRACK  TokenType = "["
	RBRACK  TokenType = "]"
	DOT     TokenType = "."
	COMMA   TokenType = ","
	SEMICOL TokenType = ";"
	PLUS    TokenType = "+"
	MINUS   TokenType = "-"
	ASTER   TokenType = "*"
	SLASH   TokenType = "/"
	AND     TokenType = "&"
	PIPE    TokenType = "|"
	LT      TokenType = "<"
	GT      TokenType = ">"
	EQ      TokenType = "="
	TILDE   TokenType = "~"
	QUOTE   TokenType = "\""

	// keywords
	CLASS       TokenType = "CLASS"
	CONSTRUCTOR TokenType = "CONSTRUCTOR"
	FUNCTION    TokenType = "FUNCTION"
	METHOD      TokenType = "METHOD"
	FIELD       TokenType = "FIELD"
	STATIC      TokenType = "STATIC"
	VAR         TokenType = "VAR"
	INT         TokenType = "INT"
	CHAR        TokenType = "CHAR"
	BOOLEAN     TokenType = "BOOLEAN"
	VOID        TokenType = "VOID"
	TRUE        TokenType = "TRUE"
	FALSE       TokenType = "FALSE"
	NULL        TokenType = "NULL"
	THIS        TokenType = "THIS"
	LET         TokenType = "LET"
	DO          TokenType = "DO"
	IF          TokenType = "IF"
	ELSE        TokenType = "ELSE"
	WHILE       TokenType = "WHILE"
	RETURN      TokenType = "RETURN"

	// Other
	INTEGER    TokenType = "INTEGER"
	STRING     TokenType = "STRING"
	IDENTIFIER TokenType = "IDENTIFIER"
	ILLEGAL    TokenType = "ILLEGAL"
	EOF        TokenType = "EOF"
)

var (
	keywords = map[string]TokenType{
		"class":       CLASS,
		"constructor": CONSTRUCTOR,
		"function":    FUNCTION,
		"method":      METHOD,
		"field":       FIELD,
		"static":      STATIC,
		"var":         VAR,
		"int":         INT,
		"char":        CHAR,
		"boolean":     BOOLEAN,
		"void":        VOID,
		"true":        TRUE,
		"false":       FALSE,
		"null":        NULL,
		"this":        THIS,
		"let":         LET,
		"do":          DO,
		"if":          IF,
		"else":        ELSE,
		"while":       WHILE,
		"return":      RETURN,
	}
)
