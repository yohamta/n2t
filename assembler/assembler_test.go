package main

import (
	"testing"
)

func TestAssembler_symbols(t *testing.T) {
	input := `
	@2
	// comment
	@3
	(LOOP)
	@LOOP
	@FOO
	(END)
	@BAR
	D=D+A
	`
	assembler := NewAssembler([]byte(input))
	if err := assembler.findLables(); err != nil {
		t.Fatalf("unexpected error: %v", err)
	}
	if err := assembler.findVars(); err != nil {
		t.Fatalf("unexpected error: %v", err)
	}
	tests := []struct {
		symbol string
		addr   Address
	}{
		{"LOOP", 2},
		{"END", 4},
		{"FOO", 16},
		{"BAR", 17},
		{"R1", 1},
	}
	for i, tt := range tests {
		got, err := assembler.symbols.GetAddress(tt.symbol)
		if err != nil {
			t.Fatalf("test %d: unexpected error: %v", i, err)
		}
		if got != tt.addr {
			t.Fatalf("test %d: expected address %d, got %d", i, tt.addr, got)
		}
	}
}

func TestAssembler_Assemble(t *testing.T) {
	input := `
	@R0
	D=D+A
	M=M-1
	`
	assembler := NewAssembler([]byte(input))
	if err := assembler.findLables(); err != nil {
		t.Fatalf("unexpected error: %v", err)
	}
	if err := assembler.findVars(); err != nil {
		t.Fatalf("unexpected error: %v", err)
	}
	tests := []string{
		"0000000000000000",
		"1110000010010000",
		"1111110010001000",
	}
	codes, err := assembler.Assemble()
	if err != nil {
		t.Fatalf("unexpected error: %v", err)
	}
	if len(codes) != len(tests) {
		t.Fatalf("expected %d codes, got %d", len(tests), len(codes))
	}
	for i, want := range tests {
		if got := codes[i]; got != want {
			t.Errorf("expected code %s, got %s", want, got)
		}
	}
}
