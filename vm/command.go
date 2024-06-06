package main

import (
	"fmt"
	"strconv"
)

type CmdType string

const (
	CmdPush     CmdType = "push"
	CmdPop      CmdType = "pop"
	CmdAdd      CmdType = "add"
	CmdSub      CmdType = "sub"
	CmdNeg      CmdType = "neg"
	CmdEq       CmdType = "eq"
	CmdGt       CmdType = "gt"
	CmdLt       CmdType = "lt"
	CmdAnd      CmdType = "and"
	CmdOr       CmdType = "or"
	CmdNot      CmdType = "not"
	CmdComment  CmdType = "comment"
	CmdLabel    CmdType = "label"
	CmdIfGoto   CmdType = "if-goto"
	CmdGoto     CmdType = "goto"
	CmdFunction CmdType = "function"
	CmdCall     CmdType = "call"
	CmdReturn   CmdType = "return"
)

func (c CmdType) String() string {
	return string(c)
}

var (
	Constant = Segment{Name: "constant", Symbol: ""}
	Stack    = Segment{Name: "stack", Symbol: "SP"}
	Local    = Segment{Name: "local", Symbol: "LCL"}
	Argument = Segment{Name: "argument", Symbol: "ARG"}
	This     = Segment{Name: "this", Symbol: "THIS"}
	That     = Segment{Name: "that", Symbol: "THAT"}
	Temp     = Segment{Name: "temp", Symbol: "TEMP", Range: Range{Start: 0, End: 8}, Base: TempBase}
	Pointer  = Segment{Name: "pointer", Symbol: "POINTER", Range: Range{Start: 0, End: 2}}
	Static   = Segment{Name: "static", Symbol: "STATIC"}
)

const (
	TempBase = 5
)

type Segment struct {
	Name   string
	Symbol string
	Range  Range
	Base   Address
}

type Range struct {
	Start, End int
}

func (s Segment) Contains(addr Address) bool {
	if s.Range.Start == 0 && s.Range.End == 0 {
		return true
	}
	return s.Range.Start <= int(addr) && int(addr) < s.Range.End
}

func (s Segment) String() string {
	return s.Symbol
}

var (
	Segments = map[string]Segment{
		"constant": Constant,
		"local":    Local,
		"argument": Argument,
		"this":     This,
		"that":     That,
		"temp":     Temp,
		"pointer":  Pointer,
		"static":   Static,
	}
)

type Command struct {
	CmdType  CmdType
	Segment  Segment
	Address  Address
	Label    string
	Function string
	NArgs    int
}

func (c Command) String() string {
	switch c.CmdType {
	case CmdPush, CmdPop:
		return fmt.Sprintf("%s %s %d", c.CmdType, c.Segment, c.Address)
	case CmdLabel, CmdGoto, CmdIfGoto:
		return fmt.Sprintf("%s %s", c.CmdType, c.Label)
	case CmdFunction:
		return fmt.Sprintf("%s %s %d", c.CmdType, c.Function, c.NArgs)
	case CmdCall:
		return fmt.Sprintf("%s %s %d", c.CmdType, c.Function, c.NArgs)
	}
	return c.CmdType.String()
}

const (
	wordSize = 16
)

type Address int

func ParseAddress(s string) (Address, error) {
	i, err := strconv.ParseInt(s, 10, wordSize)
	if err != nil {
		return 0, err
	}
	return Address(i), nil
}

func ParseInt(s string) (int, error) {
	i, err := strconv.ParseInt(s, 10, wordSize)
	if err != nil {
		return 0, err
	}
	return int(i), nil
}
