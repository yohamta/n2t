package main

import (
	"fmt"
)

type Parser struct {
	pos   int
	input []byte
}

func NewParser(program []byte) *Parser {
	return &Parser{input: program}
}

func (p *Parser) HasMoreCommands() bool {
	p.skipWhiteSpace()
	return p.pos < len(p.input)
}

func (p *Parser) Advance() (Command, error) {
	if p.isComment() {
		return p.parseComment(), nil
	}
	cmd := CmdType(p.parseIdentifier())
	switch cmd {
	case CmdPush, CmdPop:
		return p.parseMemoryCommand(cmd)
	case CmdAdd, CmdSub, CmdNeg, CmdEq, CmdGt, CmdLt, CmdAnd, CmdOr, CmdNot:
		return Command{CmdType: cmd}, nil
	case CmdLabel, CmdIfGoto, CmdGoto:
		return Command{CmdType: cmd, Label: p.parseIdentifier()}, nil
	case CmdFunction, CmdCall, CmdReturn:
		return p.parseFunctionCommand(cmd)
	default:
		return Command{}, fmt.Errorf("invalid command: %v", cmd)
	}
}

func (p *Parser) parseFunctionCommand(cmd CmdType) (Command, error) {
	switch cmd {
	case CmdFunction, CmdCall:
		name := p.parseIdentifier()
		n, err := ParseInt(p.parseNumber())
		if err != nil {
			return Command{}, fmt.Errorf("unable to parse number: %v", err)
		}
		return Command{CmdType: cmd, Function: name, NArgs: n}, nil
	case CmdReturn:
		return Command{CmdType: cmd}, nil
	}
	panic("unreachable")
}

func (p *Parser) parseMemoryCommand(cmd CmdType) (Command, error) {
	seg, ok := Segments[p.parseIdentifier()]
	if !ok {
		return Command{}, fmt.Errorf("invalid segment: %v", seg)
	}
	addr, err := ParseAddress(p.parseNumber())
	if err != nil {
		return Command{}, fmt.Errorf("invalid address: %v", err)
	}
	if !seg.Contains(addr) {
		return Command{}, fmt.Errorf("address out of range: %v", addr)
	}
	return Command{CmdType: cmd, Segment: seg, Address: addr + seg.Base}, nil
}

func (p *Parser) parseIdentifier() string {
	p.skipWhiteSpace()
	lit := ""
	for !p.isWhiteSpace(p.peek()) {
		lit += string(p.peek())
		p.pos++
	}
	return lit
}

func (p *Parser) parseNumber() string {
	p.skipWhiteSpace()
	lit := ""
	for p.isDigit(p.peek()) {
		lit += string(p.peek())
		p.pos++
	}
	return lit
}

func (p *Parser) parseComment() Command {
	for !p.isLineEnd() && !p.isEnd() {
		p.pos++
	}
	return Command{
		CmdType: CmdComment,
	}
}

func (p *Parser) isLineEnd() bool {
	return p.peek() == '\n' || p.peek() == '\r'
}

func (p *Parser) isEnd() bool {
	return p.pos >= len(p.input)
}

func (p *Parser) isDigit(ch byte) bool {
	return ch >= '0' && ch <= '9'
}

func (p *Parser) isWhiteSpace(ch byte) bool {
	return ch == ' ' || ch == '\t' || ch == '\n' || ch == '\r' || ch == 0
}

func (p *Parser) peek() byte {
	if p.pos >= len(p.input) {
		return 0
	}
	return p.input[p.pos]
}

func (p *Parser) peekNext() byte {
	if p.pos+1 >= len(p.input) {
		return 0
	}
	return p.input[p.pos+1]
}

func (p *Parser) skipWhiteSpace() {
	for p.isWhiteSpace(p.peek()) && p.pos < len(p.input) {
		p.pos++
	}
}

func (p *Parser) isComment() bool {
	for p.isWhiteSpace(p.peek()) {
		p.pos++
	}
	return p.peek() == '/' && p.peekNext() == '/'
}
