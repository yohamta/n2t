package main

import (
	"fmt"
)

type Assembler struct {
	symbols *SymbolTable
	parser  *Parser
}

func NewAssembler(program []byte) *Assembler {
	return &Assembler{
		parser:  NewParser(program),
		symbols: NewSymbolTable(),
	}
}

func (a *Assembler) Assemble() ([]string, error) {
	if err := a.findLables(); err != nil {
		return nil, err
	}
	if err := a.findVars(); err != nil {
		return nil, err
	}
	coder := NewCoder(a.symbols)
	a.parser.Reset()

	var codes []string
	for a.parser.HasMoreCommands() {
		c, err := a.parser.Advance()
		if err != nil {
			return nil, fmt.Errorf("failed to parse command: %v", err)
		}
		switch c.Type {
		case AInstruction, CInstruction:
			code, err := coder.Code(c)
			if err != nil {
				return nil, fmt.Errorf("failed to code command: %v", err)
			}
			codes = append(codes, code)
		}
	}
	return codes, nil
}

func (a *Assembler) findVars() error {
	a.parser.Reset()
	for a.parser.HasMoreCommands() {
		c, err := a.parser.Advance()
		if err != nil {
			return fmt.Errorf("failed to parse command: %v", err)
		}
		switch c.Type {
		case AInstruction:
			if c.Symbol != "" && !a.symbols.Contains(c.Symbol) {
				a.symbols.AddVariable(c.Symbol)
			}
		}
	}
	return nil
}

func (a *Assembler) findLables() error {
	var instructionAddress Address = 0
	for a.parser.HasMoreCommands() {
		c, err := a.parser.Advance()
		if err != nil {
			return fmt.Errorf("failed to parse command: %v", err)
		}
		switch c.Type {
		case AInstruction, CInstruction:
			instructionAddress++
		case Label:
			if a.symbols.Contains(c.Symbol) {
				return fmt.Errorf("label %s already defined", c.Symbol)
			}
			a.symbols.AddLabel(c.Symbol, instructionAddress)
		}
	}
	return nil
}
