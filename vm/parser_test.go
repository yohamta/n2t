package main

import (
	"testing"
)

func TestAdvance(t *testing.T) {
	input := `
	push constant 7
	// comment
	push local 2
	add
	pop local 0

	push temp 5
	label LOOP
	if-goto END
	goto LOOP

	function SimpleFunction.test 2
	call SimpleFunction.test 2
	return
	`
	parser := NewParser([]byte(input))

	tests := []Command{
		{
			CmdType: CmdPush,
			Segment: Constant,
			Address: 7,
		},
		{
			CmdType: CmdComment,
		},
		{
			CmdType: CmdPush,
			Segment: Local,
			Address: 2,
		},
		{
			CmdType: CmdAdd,
		},
		{
			CmdType: CmdPop,
			Segment: Local,
			Address: 0,
		},
		{
			CmdType: CmdPush,
			Segment: Temp,
			Address: 10,
		},
		{
			CmdType: CmdLabel,
			Label:   "LOOP",
		},
		{
			CmdType: CmdIfGoto,
			Label:   "END",
		},
		{
			CmdType: CmdGoto,
			Label:   "LOOP",
		},
		{
			CmdType:  CmdFunction,
			Function: "SimpleFunction.test",
			NArgs:    2,
		},
		{
			CmdType:  CmdCall,
			Function: "SimpleFunction.test",
			NArgs:    2,
		},
		{
			CmdType: CmdReturn,
		},
	}
	for _, want := range tests {
		cmd, err := parser.Advance()
		if err != nil {
			t.Fatalf("unexpected error: %#v", err)
		}
		if cmd != want {
			t.Errorf("expected %#v, got %#v", want, cmd)
		}
	}
	if parser.HasMoreCommands() {
		t.Errorf("expected no more commands")
	}
}
