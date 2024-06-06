# Nand to Tetris Golang Implementation
Nand2Tetris website: http://nand2tetris.org/

## 1. Assembler part

The Assembler translates assembly code (`*.asm`) into the machine code (`*.hack`).

You can read the article in the following URLs:

- EN: [Medium](https://medium.com/@yohata/understanding-computer-architecture-through-nand-to-tetris-implementing-an-assembler-in-go-df515e19a974)
- JA: [Zenn](https://zenn.dev/tacoms/articles/1a8e9e1bc81d68)

How to run assembler on the example:

```sh
cd ./assembler
go run . ../examples/Pong/Pong.asm
```

## 2. VM Translator part

The VM Translater translates virtual machine code (`*.vm`) into assembly code (`*.asm`).

How to run VM Translator on the example:

```sh
cd ./vm
go run . ../examples/Pong
```

## 3. Compiler part

The Compiler compiles the programs (`*.jack`) into VM code (`*.vm`).

The `*.jack` files are programs written in the "Jack language", which is a simple programming language that is developed by the nand to tetris creators.

How to compile an example jack file:

```sh
cd ./compiler
go run . ../examples/Pong
```
