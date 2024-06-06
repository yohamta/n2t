package main

import "fmt"

type Tokenizer struct {
	ch    byte
	line  int
	row   string
	pos   int
	input []byte
}

func NewTokenizer(program []byte) *Tokenizer {
	return &Tokenizer{input: program, line: 1, pos: -1}
}

func (p *Tokenizer) HasMoreTokens() bool {
	p.skipWhiteSpace()
	return p.pos < len(p.input)
}

func (p *Tokenizer) Line() string {
	return fmt.Sprintf("line %d: %#q", p.line, p.row)
}

func (p *Tokenizer) Advance() Token {
	p.skipWhiteSpace()

	tok := Token{}

	switch p.ch {
	case '{':
		tok = newToken(LBRACE, p.ch)
	case '}':
		tok = newToken(RBRACE, p.ch)
	case '(':
		tok = newToken(LPAREN, p.ch)
	case ')':
		tok = newToken(RPAREN, p.ch)
	case '[':
		tok = newToken(LBRACK, p.ch)
	case ']':
		tok = newToken(RBRACK, p.ch)
	case '.':
		tok = newToken(DOT, p.ch)
	case ',':
		tok = newToken(COMMA, p.ch)
	case ';':
		tok = newToken(SEMICOL, p.ch)
	case '+':
		tok = newToken(PLUS, p.ch)
	case '-':
		tok = newToken(MINUS, p.ch)
	case '*':
		tok = newToken(ASTER, p.ch)
	case '/':
		tok = newToken(SLASH, p.ch)
	case '&':
		tok = newToken(AND, p.ch)
	case '|':
		tok = newToken(PIPE, p.ch)
	case '<':
		tok = newToken(LT, p.ch)
	case '>':
		tok = newToken(GT, p.ch)
	case '=':
		tok = newToken(EQ, p.ch)
	case '~':
		tok = newToken(TILDE, p.ch)
	case '"':
		tok.TokenType = STRING
		tok.Literal = p.readString()
	default:
		if p.isLetter(p.ch) {
			tok.Literal = p.readIdentifier()
			if t, ok := keywords[tok.Literal]; ok {
				tok.TokenType = t
			} else {
				tok.TokenType = IDENTIFIER
			}
			break
		} else if p.isDigit(p.ch) {
			tok.TokenType = INTEGER
			tok.Literal = p.readNumber()
		} else {
			tok.TokenType = ILLEGAL
		}
	}

	p.readChar()
	p.skipWhiteSpace()

	return tok
}

func (p *Tokenizer) readChar() {
	if p.pos == 0 && len(p.input) > 0 {
		p.ch = p.input[0]
	}
	if p.pos == len(p.input)-1 {
		p.ch = 0
		p.pos++
		return
	}
	if p.isLineEnd(p.ch) {
		p.line++
		p.row = ""
	}
	p.pos++
	p.ch = p.input[p.pos]
	p.row += string(p.ch)
}

func (p *Tokenizer) readIdentifier() string {
	pos := p.pos
	for p.isLetter(p.peekNext()) || p.isDigit(p.peekNext()) {
		p.readChar()
	}
	return string(p.input[pos : p.pos+1])
}

func (p *Tokenizer) readString() string {
	pos := p.pos
	for p.readChar(); p.ch != '"'; {
		p.readChar()
	}
	return string(p.input[pos+1 : p.pos])
}

func (p *Tokenizer) readNumber() string {
	pos := p.pos
	for p.isDigit(p.peekNext()) {
		p.readChar()
	}
	return string(p.input[pos : p.pos+1])
}

func (p *Tokenizer) isLetter(ch byte) bool {
	return (ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z') || ch == '_'
}

func (p *Tokenizer) isLineEnd(ch byte) bool {
	return ch == '\n'
}

func (p *Tokenizer) isEnd() bool {
	return p.pos == len(p.input)
}

func (p *Tokenizer) isDigit(ch byte) bool {
	return ch >= '0' && ch <= '9'
}

func (p *Tokenizer) isWhiteSpace(ch byte) bool {
	return ch == ' ' || ch == '\t' || ch == '\n' || ch == '\r' || ch == 0
}

func (p *Tokenizer) peekNext() byte {
	if p.pos+1 >= len(p.input) {
		return 0
	}
	return p.input[p.pos+1]
}

func (p *Tokenizer) skipWhiteSpace() {
	for {
		for p.isWhiteSpace(p.ch) && !p.isEnd() {
			p.readChar()
		}
		if p.isComment() {
			p.skipComment()
			continue
		}
		if p.isBlockComment() {
			p.skipBlockComment()
			continue
		}
		break
	}
}

func (p *Tokenizer) skipComment() {
	for !p.isLineEnd(p.ch) && !p.isEnd() {
		p.readChar()
	}
}

func (p *Tokenizer) skipBlockComment() {
	for {
		if p.ch == '*' && p.peekNext() == '/' {
			p.readChar()
			p.readChar()
			return
		}
		p.readChar()
	}
}

func (p *Tokenizer) isBlockComment() bool {
	return p.ch == '/' && p.peekNext() == '*'
}

func (p *Tokenizer) isComment() bool {
	return p.ch == '/' && p.peekNext() == '/'
}
