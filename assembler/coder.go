package main

import (
	"fmt"
)

type Coder struct {
	symbols *SymbolTable
}

func NewCoder(symbols *SymbolTable) *Coder {
	return &Coder{
		symbols: symbols,
	}
}

func (c *Coder) Code(cmd Command) (string, error) {
	switch cmd.Type {
	case CInstruction:
		comp, err := c.codeComp(cmd.Comp)
		if err != nil {
			return "", err
		}
		dest, err := c.codeDest(cmd.Dest)
		if err != nil {
			return "", err
		}
		jump, err := c.codeJump(cmd.Jump)
		if err != nil {
			return "", err
		}
		return "111" + comp + dest + jump, nil
	case AInstruction:
		if cmd.Symbol != "" {
			symbolAddress, err := c.symbols.GetAddress(cmd.Symbol)
			if err != nil {
				return "", err
			}
			code, err := c.codeAddr(symbolAddress)
			if err != nil {
				return "", err
			}
			return "0" + code, nil
		}
		addr, err := c.codeAddr(cmd.Address)
		if err != nil {
			return "", err
		}
		return "0" + addr, nil
	default:
		return "", fmt.Errorf("invalid command type: %v", cmd.Type)
	}
}

var (
	compCodes = map[string]string{
		"0":   "0101010",
		"1":   "0111111",
		"-1":  "0111010",
		"D":   "0001100",
		"A":   "0110000",
		"M":   "1110000",
		"!D":  "0001101",
		"!A":  "0110001",
		"!M":  "1110001",
		"-D":  "0001111",
		"-A":  "0110011",
		"-M":  "1110011",
		"D+1": "0011111",
		"A+1": "0110111",
		"M+1": "1110111",
		"D-1": "0001110",
		"A-1": "0110010",
		"M-1": "1110010",
		"D+A": "0000010",
		"D+M": "1000010",
		"D-A": "0010011",
		"D-M": "1010011",
		"A-D": "0000111",
		"M-D": "1000111",
		"D&A": "0000000",
		"D&M": "1000000",
		"D|A": "0010101",
		"D|M": "1010101",
	}

	jumpCodes = map[string]string{
		"":    "000",
		"JGT": "001",
		"JEQ": "010",
		"JGE": "011",
		"JLT": "100",
		"JNE": "101",
		"JLE": "110",
		"JMP": "111",
	}

	destCodes = map[string]string{
		"":    "000",
		"M":   "001",
		"D":   "010",
		"MD":  "011",
		"A":   "100",
		"AM":  "101",
		"AD":  "110",
		"AMD": "111",
	}
)

func (c *Coder) codeAddr(addr Address) (string, error) {
	a := fmt.Sprintf("%015b", addr)
	if len(a) > 15 {
		return "", fmt.Errorf("invalid address: %d", addr)
	}
	return a, nil
}

func (c *Coder) codeJump(jump string) (string, error) {
	if code, ok := jumpCodes[jump]; ok {
		return code, nil
	}
	return "", fmt.Errorf("invalid jump instruction: %s", jump)
}

func (c *Coder) codeDest(dest string) (string, error) {
	if code, ok := destCodes[dest]; ok {
		return code, nil
	}
	return "", fmt.Errorf("invalid dest instruction: %s", dest)
}

func (c *Coder) codeComp(comp string) (string, error) {
	if code, ok := compCodes[comp]; ok {
		return code, nil
	}
	return "", fmt.Errorf("invalid comp instruction: %s", comp)
}
