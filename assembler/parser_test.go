package main

import (
	"testing"
)

func TestAdvance(t *testing.T) {
	input := `
	// comment
	@2
	// comment2
	// comment3
	D=A
	@3
	D=D+A
	@0
	M=D
	(LOOP)
	@123
	@VAR
	@R0
	`
	parser := NewParser([]byte(input))

	tests := []Command{
		{Type: Comment},
		{
			Type:    AInstruction,
			Address: 2,
		},
		{Type: Comment},
		{Type: Comment},
		{
			Type: CInstruction,
			Dest: "D",
			Comp: "A",
		},
		{
			Type:    AInstruction,
			Address: 3,
		},
		{
			Type: CInstruction,
			Dest: "D",
			Comp: "D+A",
		},
		{
			Type:    AInstruction,
			Address: 0,
		},
		{
			Type: CInstruction,
			Dest: "M",
			Comp: "D",
		},
		{
			Type:   Label,
			Symbol: "LOOP",
		},
		{
			Type:    AInstruction,
			Address: 123,
		},
		{
			Type:   AInstruction,
			Symbol: "VAR",
		},
		{
			Type:   AInstruction,
			Symbol: "R0",
		},
	}
	for _, want := range tests {
		cmd, err := parser.Advance()
		if err != nil {
			t.Fatalf("unexpected error: %v", err)
		}
		if cmd != want {
			t.Errorf("expected %v, got %v", want, cmd)
		}
	}
	if parser.HasMoreCommands() {
		t.Errorf("expected no more commands")
	}
}
