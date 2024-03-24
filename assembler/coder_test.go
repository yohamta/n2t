package main

import (
	"fmt"
	"testing"
)

func TestCoder_codeJump(t *testing.T) {
	tests := []struct {
		arg  string
		want string
	}{
		{
			arg:  "",
			want: "000",
		},
		{
			arg:  "JGT",
			want: "001",
		},
		{
			arg:  "JEQ",
			want: "010",
		},
		{
			arg:  "JGE",
			want: "011",
		},
		{
			arg:  "JLT",
			want: "100",
		},
		{
			arg:  "JNE",
			want: "101",
		},
		{
			arg:  "JLE",
			want: "110",
		},
		{
			arg:  "JMP",
			want: "111",
		},
	}
	for _, tt := range tests {
		t.Run(tt.arg, func(t *testing.T) {
			c := &Coder{}
			got, err := c.codeJump(tt.arg)
			if err != nil {
				t.Errorf("unexpected error: %v", err)
			}
			if got != tt.want {
				t.Errorf("Coder.codeJump() = %v, want %v", got, tt.want)
			}
		})
	}
}

func TestCoder_codeComp(t *testing.T) {
	tests := []struct {
		arg  string
		want string
	}{
		{
			arg:  "0",
			want: "0101010",
		},
		{
			arg:  "1",
			want: "0111111",
		},
		{
			arg:  "-1",
			want: "0111010",
		},
		{
			arg:  "D",
			want: "0001100",
		},
		{
			arg:  "A",
			want: "0110000",
		},
		{
			arg:  "M",
			want: "1110000",
		},
		{
			arg:  "!D",
			want: "0001101",
		},
		{
			arg:  "!A",
			want: "0110001",
		},
		{
			arg:  "!M",
			want: "1110001",
		},
		{
			arg:  "-D",
			want: "0001111",
		},
		{
			arg:  "-A",
			want: "0110011",
		},
		{
			arg:  "-M",
			want: "1110011",
		},
		{
			arg:  "D+1",
			want: "0011111",
		},
		{
			arg:  "A+1",
			want: "0110111",
		},
		{
			arg:  "M+1",
			want: "1110111",
		},
		{
			arg:  "D-1",
			want: "0001110",
		},
		{
			arg:  "A-1",
			want: "0110010",
		},
		{
			arg:  "M-1",
			want: "1110010",
		},
		{
			arg:  "D+A",
			want: "0000010",
		},
		{
			arg:  "D+M",
			want: "1000010",
		},
		{
			arg:  "D-A",
			want: "0010011",
		},
		{
			arg:  "D-M",
			want: "1010011",
		},
		{
			arg:  "A-D",
			want: "0000111",
		},
		{
			arg:  "M-D",
			want: "1000111",
		},
		{
			arg:  "D&A",
			want: "0000000",
		},
		{
			arg:  "D&M",
			want: "1000000",
		},
		{
			arg:  "D|A",
			want: "0010101",
		},
		{
			arg:  "D|M",
			want: "1010101",
		},
	}
	for _, tt := range tests {
		t.Run(tt.arg, func(t *testing.T) {
			c := &Coder{}
			got, err := c.codeComp(tt.arg)
			if err != nil {
				t.Errorf("unexpected error: %v", err)
			}
			if got != tt.want {
				t.Errorf("Coder.codeJump() = %v, want %v", got, tt.want)
			}
		})
	}
}

func TestCoder_codeDest(t *testing.T) {
	tests := []struct {
		arg  string
		want string
	}{
		{
			arg:  "",
			want: "000",
		},
		{
			arg:  "AMD",
			want: "111",
		},
		{
			arg:  "MD",
			want: "011",
		},
		{
			arg:  "AM",
			want: "101",
		},
		{
			arg:  "AD",
			want: "110",
		},
		{
			arg:  "A",
			want: "100",
		},
		{
			arg:  "D",
			want: "010",
		},
		{
			arg:  "M",
			want: "001",
		},
	}
	for _, tt := range tests {
		t.Run(tt.arg, func(t *testing.T) {
			c := &Coder{}
			got, err := c.codeDest(tt.arg)
			if err != nil {
				t.Errorf("unexpected error: %v", err)
			}
			if got != tt.want {
				t.Errorf("Coder.codeJump() = %v, want %v", got, tt.want)
			}
		})
	}
}

func TestCoder_Code(t *testing.T) {
	type fields struct {
		symbols *SymbolTable
	}
	tests := []struct {
		fields fields
		arg    Command
		want   string
	}{
		{
			arg: Command{
				Type: CInstruction,
				Comp: "D+A",
				Dest: "D",
				Jump: "JGT",
			},
			want: "111" + "0000010" + "010" + "001",
		},
		{
			arg: Command{
				Type: CInstruction,
				Comp: "0",
				Jump: "JEQ",
			},
			want: "111" + "0101010" + "000" + "010",
		},
		{
			arg: Command{
				Type:    AInstruction,
				Address: 21,
			},
			want: "0000000000010101",
		},
		{
			fields: fields{
				symbols: &SymbolTable{
					store: map[string]Address{
						"LOOP": 21,
					},
				},
			},
			arg: Command{
				Type:   AInstruction,
				Symbol: "LOOP",
			},
			want: "0000000000010101",
		},
		{
			fields: fields{
				symbols: &SymbolTable{
					store: map[string]Address{
						"R0": 0,
					},
				},
			},
			arg: Command{
				Type:   AInstruction,
				Symbol: "R0",
			},
			want: "0000000000000000",
		},
		{
			arg: Command{
				Type: CInstruction,
				Dest: "M",
				Comp: "M-1",
			},
			want: "111" + "1110010" + "001" + "000",
		},
	}
	for _, tt := range tests {
		t.Run(fmt.Sprintf("%v", tt.arg), func(t *testing.T) {
			c := &Coder{
				symbols: tt.fields.symbols,
			}
			got, err := c.Code(tt.arg)
			if err != nil {
				t.Errorf("unexpected error: %v", err)
			}
			if got != tt.want {
				t.Errorf("Coder.Code() = %v, want %v", got, tt.want)
			}
		})
	}
}
