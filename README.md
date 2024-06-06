# Nand to Tetris Golang Implementation
Nand2Tetris website: http://nand2tetris.org/

## 1. Assembler part

Assembler translates assembly code (`*.asm`) into the machine code (`*.hack`).

You can read the article in the following URLs:

- EN: [Medium](https://medium.com/@yohata/understanding-computer-architecture-through-nand-to-tetris-implementing-an-assembler-in-go-df515e19a974)
- JA: [Zenn](https://zenn.dev/tacoms/articles/1a8e9e1bc81d68)

How to run assembler on the examples:

```sh
# cd to the assembler directory and run the following command.
go run . ../examples/Pong/Pong.asm
```

## 2. VM Translator part

VM Translater translates virtual machine code (`*.vm`) into assembly code (`*.asm`).

How to run VM Translator on the examples:

```sh
# cd to the vm directory and run the following command:
go run . ../examples/Pong
```