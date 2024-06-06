package main

import (
	"strings"
	"testing"
)

func TestCompiler_compileClass(t *testing.T) {
	tests := []struct {
		input string
		want  []string
	}{
		{
			input: `class Main {
						function void main() {
							var SquareGame game;
							let game = SquareGame.new();
							do game.run();
							do game.dispose();
							return;
						}
					}`,
			want: []string{
				"function Main.main 1",
				"call SquareGame.new 0",
				"pop local 0",
				"push local 0",
				"call SquareGame.run 1",
				"pop temp 0",
				"push local 0",
				"call SquareGame.dispose 1",
				"pop temp 0",
				"push constant 0",
				"return",
			},
		},
		{
			input: `class SnakeGame {
						field Snake snake;
						field int direction;
						constructor SnakeGame new() {
						   let snake = Snake.new(0, 0, 10);
						   let direction = 0;
						   return this;
						}
					}
			`,
			want: []string{
				"function SnakeGame.new 0",
				"push constant 2",
				"call Memory.alloc 1",
				"pop pointer 0",
				"push constant 0",
				"push constant 0",
				"push constant 10",
				"call Snake.new 3",
				"pop this 0",
				"push constant 0",
				"pop this 1",
				"push pointer 0",
				"return",
			},
		},
		{
			input: `class Snake {
						field int x, y;
						field int size;

						constructor Snake new(int ax, int ay, int asize) {
						   let x = ax;
						   let y = ay;
						   let size = asize;
						   do draw();
						   return this;
						}
					}
			`,
			want: []string{
				"function Snake.new 0",
				"push constant 3",
				"call Memory.alloc 1",
				"pop pointer 0",
				"push argument 0",
				"pop this 0",
				"push argument 1",
				"pop this 1",
				"push argument 2",
				"pop this 2",
				"push pointer 0",
				"call Snake.draw 1",
				"pop temp 0",
				"push pointer 0",
				"return",
			},
		},
		{
			input: `class Snake {
						constructor Snake new(int x, int y) {
						   var int z;
						   let z = x + y;
						   return this;
						}
					}
			`,
			want: []string{
				"function Snake.new 1",
				"push constant 0",
				"call Memory.alloc 1",
				"pop pointer 0",
				"push argument 0",
				"push argument 1",
				"add",
				"pop local 0",
				"push pointer 0",
				"return",
			},
		},
		{
			input: `class Snake {
						constructor Snake new(int x, int y) {
							let x = 100;
							let y = 200;
							return this;
						}
					}
			`,
			want: []string{
				"function Snake.new 0",
				"push constant 0",
				"call Memory.alloc 1",
				"pop pointer 0",
				"push constant 100",
				"pop argument 0",
				"push constant 200",
				"pop argument 1",
				"push pointer 0",
				"return",
			},
		},
		{
			input: `class Snake {
						method void dispose() {
						   do Memory.deAlloc(this);
						   return;
						}
					}
			`,
			want: []string{
				"function Snake.dispose 0",
				"push argument 0",
				"pop pointer 0",
				"push pointer 0",
				"call Memory.deAlloc 1",
				"pop temp 0",
				"push constant 0",
				"return",
			},
		},
		{
			input: `class Snake {
						method int move() {
							var int x;
							let x = getX() + 1;
							do setX(x);
							return x;
						}
					}
			`,
			want: []string{
				"function Snake.move 1",
				"push argument 0",
				"pop pointer 0",
				"push pointer 0",
				"call Snake.getX 1",
				"push constant 1",
				"add",
				"pop local 0",
				"push pointer 0",
				"push local 0",
				"call Snake.setX 2",
				"pop temp 0",
				"push local 0",
				"return",
			},
		},
	}
	for _, tt := range tests {
		t.Run(tt.input, func(t *testing.T) {
			p := NewParser([]byte(tt.input))
			node := p.parseClass()
			if p.errs != nil {
				t.Fatalf("unexpected error: %v", p.errs)
			}
			runCompilerTest(t, node, nil, tt.want)
		})
	}
}

func TestCompiler_compileStatement(t *testing.T) {
	tests := []struct {
		input string
		st    *SymbolTable
		want  []string
	}{
		{
			input: "let x = 1;",
			st: &SymbolTable{
				store: map[string]Symbol{
					"x": {
						Name:  "x",
						Kind:  S_VAR,
						Type:  "int",
						Index: 1,
					},
				},
			},
			want: []string{
				"push constant 1",
				"pop local 1",
			},
		},
		{
			input: "let arr[i] = 1;",
			st: &SymbolTable{
				store: map[string]Symbol{
					"i": {
						Name:  "i",
						Kind:  S_FIELD,
						Type:  "int",
						Index: 1,
					},
					"arr": {
						Name:  "arr",
						Kind:  S_VAR,
						Type:  "Array",
						Index: 5,
					},
				},
			},
			want: []string{
				"push this 1",
				"push local 5",
				"add",             // arr + i
				"push constant 1", // value
				"pop temp 0",      // value to temp 0
				"pop pointer 1",   // that = arr + i
				"push temp 0",     // push value
				"pop that 0",      // that[0] = value
			},
		},
	}
	for _, tt := range tests {
		t.Run(tt.input, func(t *testing.T) {
			p := NewParser([]byte(tt.input))
			node := p.parseStatement()
			if p.errs != nil {
				t.Fatalf("unexpected error: %v", p.errs)
			}
			runCompilerTest(t, node, tt.st, tt.want)
		})
	}
}

func TestCompiler_compileExpression(t *testing.T) {
	tests := []struct {
		input string
		st    *SymbolTable
		want  []string
	}{
		{
			input: "1",
			want: []string{
				"push constant 1",
			},
		},
		{
			input: "1 + 2",
			want: []string{
				"push constant 1",
				"push constant 2",
				"add",
			},
		},
		{
			input: "1 - 2",
			want: []string{
				"push constant 1",
				"push constant 2",
				"sub",
			},
		},
		{
			input: "1 * 2",
			want: []string{
				"push constant 1",
				"push constant 2",
				"call Math.multiply 2",
			},
		},
		{
			input: "1 / 2",
			want: []string{
				"push constant 1",
				"push constant 2",
				"call Math.divide 2",
			},
		},
		{
			input: "-1",
			want: []string{
				"push constant 1",
				"neg",
			},
		},
		{
			input: "(1)",
			want: []string{
				"push constant 1",
			},
		},
		{
			input: "Math.multiply(1, 2)",
			want: []string{
				"push constant 1",
				"push constant 2",
				"call Math.multiply 2",
			},
		},
		{
			input: "true",
			want: []string{
				"push constant 0",
				"not",
			},
		},
		{
			input: "null",
			want: []string{
				"push constant 0",
			},
		},
		{
			input: "false",
			want: []string{
				"push constant 0",
			},
		},
		{
			input: "this",
			want: []string{
				"push pointer 0",
			},
		},
		{
			input: `"abc"`,
			want: []string{
				"push constant 3",
				"call String.new 1",
				"push constant 97",
				"call String.appendChar 2",
				"push constant 98",
				"call String.appendChar 2",
				"push constant 99",
				"call String.appendChar 2",
			},
		},
		{
			input: "seed * 11035",
			st: &SymbolTable{
				store: map[string]Symbol{
					"seed": {
						Name:  "seed",
						Kind:  S_FIELD,
						Type:  "int",
						Index: 0,
					},
				},
			},
			want: []string{
				"push this 0",
				"push constant 11035",
				"call Math.multiply 2",
			},
		},
	}
	for _, tt := range tests {
		t.Run(tt.input, func(t *testing.T) {
			p := NewParser([]byte(tt.input))
			node := p.parseExpression()
			if p.errs != nil {
				t.Fatalf("unexpected error: %v", p.errs)
			}
			runCompilerTest(t, node, tt.st, tt.want)
		})
	}
}

func TestCompiler_compileIfStatement(t *testing.T) {
	tests := []struct {
		input string
		st    *SymbolTable
		want  []string
	}{
		{
			input: `if (x) {
				let x = 2;
			}`,
			st: &SymbolTable{
				store: map[string]Symbol{
					"x": {
						Name:  "x",
						Kind:  S_FIELD,
						Type:  "int",
						Index: 0,
					},
				},
			},
			want: []string{
				"push this 0",
				"not",
				"if-goto IF_FALSE0",
				"push constant 2",
				"pop this 0",
				"goto IF_END0",
				"label IF_FALSE0",
				"label IF_END0",
			},
		},
		{
			input: `if (x) {
				let x = 2;
			} else {
				let x = 3;
			}`,
			st: &SymbolTable{
				store: map[string]Symbol{
					"x": {
						Name:  "x",
						Kind:  S_FIELD,
						Type:  "int",
						Index: 0,
					},
				},
			},
			want: []string{
				"push this 0",
				"not",
				"if-goto IF_FALSE0",
				"push constant 2",
				"pop this 0",
				"goto IF_END0",
				"label IF_FALSE0",
				"push constant 3",
				"pop this 0",
				"label IF_END0",
			},
		},
	}
	for _, tt := range tests {
		t.Run(tt.input, func(t *testing.T) {
			p := NewParser([]byte(tt.input))
			node := p.parseStatement()
			if p.errs != nil {
				t.Fatalf("unexpected error: %v", p.errs)
			}
			runCompilerTest(t, node, tt.st, tt.want)
		})
	}
}

func TestCompiler_compileWhileStatement(t *testing.T) {
	tests := []struct {
		input string
		st    *SymbolTable
		want  []string
	}{
		{
			input: `while (true) {
				let x = 1;
			}`,
			st: &SymbolTable{
				store: map[string]Symbol{
					"x": {
						Name:  "x",
						Kind:  S_FIELD,
						Type:  "int",
						Index: 0,
					},
				},
			},
			want: []string{
				"label WHILE_EXP0",
				"push constant 0",
				"not",
				"not",
				"if-goto WHILE_END0",
				"push constant 1",
				"pop this 0",
				"goto WHILE_EXP0",
				"label WHILE_END0",
			},
		},
	}
	for _, tt := range tests {
		t.Run(tt.input, func(t *testing.T) {
			p := NewParser([]byte(tt.input))
			node := p.parseStatement()
			if p.errs != nil {
				t.Fatalf("unexpected error: %v", p.errs)
			}
			runCompilerTest(t, node, tt.st, tt.want)
		})
	}
}

func runCompilerTest(t *testing.T, node Node, st *SymbolTable, want []string) {
	t.Helper()
	c := NewCompiler()
	if st != nil {
		c.symbolTable = st
	}

	got, err := c.Compile(node)
	if err != nil {
		t.Fatalf("unexpected error: %v", err)
	}

	lines := strings.Split(strings.TrimSpace(string(got)), "\n")
	for i, v := range lines {
		if v != want[i] {
			t.Errorf("unexpected output: want %v, got %v", want[i], v)
		}
		if i == len(want)-1 {
			break
		}
	}
	if len(lines) != len(want) {
		t.Fatalf("unexpected output:\n%s", string(got))
	}
}
