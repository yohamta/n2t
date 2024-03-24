package main

import (
	"fmt"
)

type Parser struct {
	pos   int
	input []byte
}

type Command struct {
	Type    CommandType
	Address Address
	Symbol  string
	Comp    string
	Dest    string
	Jump    string
}

type CommandType int

const (
	AInstruction CommandType = iota
	CInstruction
	Label
	Comment
)

func NewParser(program []byte) *Parser {
	return &Parser{
		input: program,
	}
}

func (p *Parser) Reset() {
	p.pos = 0
}

func (p *Parser) HasMoreCommands() bool {
	p.skipWhiteSpace()
	return p.pos < len(p.input)
}

func (p *Parser) Advance() (Command, error) {
	p.skipWhiteSpace()
	if p.isComment() {
		return p.readComment(), nil
	}
	switch p.peek() {
	case '@':
		return p.readAInstruction()
	case '(':
		return p.readLabel(), nil
	default:
		return p.readCInstruction()
	}
}

func (p *Parser) readLabel() Command {
	lit := ""
	p.pos++
	for p.peek() != ')' {
		lit += string(p.peek())
		p.pos++
	}
	p.pos++
	return Command{
		Type:   Label,
		Symbol: lit,
	}
}

func (p *Parser) readAInstruction() (Command, error) {
	p.pos++

	ch := p.peek()
	switch {
	case p.isDigit(ch):
		addr, err := ParseAddress(p.readNumber())
		if err != nil {
			return Command{}, fmt.Errorf("invalid address: %v", err)
		}
		return Command{
			Type:    AInstruction,
			Address: addr,
		}, nil
	default:
		lit := ""
		for !p.isWhiteSpace(p.peek()) {
			lit += string(p.peek())
			p.pos++
		}
		return Command{
			Type:   AInstruction,
			Symbol: lit,
		}, nil
	}
}

func (p *Parser) readNumber() string {
	lit := ""
	for p.isDigit(p.peek()) {
		lit += string(p.peek())
		p.pos++
	}
	return lit
}

func (p *Parser) isDigit(ch byte) bool {
	return ch >= '0' && ch <= '9'
}

func (p *Parser) readCInstruction() (Command, error) {
	lit := ""
	cmd := Command{
		Type: CInstruction,
	}
	jump := false
	for !p.isWhiteSpace(p.peek()) {
		ch := p.peek()
		switch ch {
		case '=':
			cmd.Dest = lit
			lit = ""
			p.pos++
		case ';':
			jump = true
			cmd.Comp = lit
			lit = ""
			p.pos++
		}
		lit += string(p.peek())
		p.pos++
	}
	if jump {
		cmd.Jump = lit
	} else {
		cmd.Comp = lit
	}
	if cmd.Comp == "" {
		return Command{}, fmt.Errorf("invalid C instruction: %v", cmd)
	}
	return cmd, nil
}

func (p *Parser) readComment() Command {
	for !p.isLineEnd() && !p.isEnd() {
		p.pos++
	}
	return Command{
		Type: Comment,
	}
}

func (p *Parser) isLineEnd() bool {
	return p.peek() == '\n' || p.peek() == '\r'
}

func (p *Parser) isEnd() bool {
	return p.pos >= len(p.input)
}

func (p *Parser) isWhiteSpace(ch byte) bool {
	return ch == ' ' || ch == '\t' || ch == '\n' || ch == '\r' || ch == 0
}

func (p *Parser) isComment() bool {
	return p.peek() == '/' && p.peekNext() == '/'
}

func (p *Parser) peekNext() byte {
	if p.pos+1 >= len(p.input) {
		return 0
	}
	return p.input[p.pos+1]
}

func (p *Parser) peek() byte {
	if p.pos >= len(p.input) {
		return 0
	}
	return p.input[p.pos]
}

func (p *Parser) skipWhiteSpace() {
	for p.isWhiteSpace(p.peek()) && p.pos < len(p.input) {
		p.pos++
	}
}
