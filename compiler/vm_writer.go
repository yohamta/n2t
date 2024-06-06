package main

import (
	"bytes"
	"fmt"
)

type Segment string

const (
	VM_CONST   Segment = "constant"
	VM_TEMP    Segment = "temp"
	VM_STATIC  Segment = "static"
	VM_LOCAL   Segment = "local"
	VM_THIS    Segment = "this"
	VM_THAT    Segment = "that"
	VM_ARG     Segment = "argument"
	VM_POINTER Segment = "pointer"
)

type VMCommand string

const (
	VM_ADD VMCommand = "add"
	VM_SUB VMCommand = "sub"
	VM_NEG VMCommand = "neg"
	VM_EQ  VMCommand = "eq"
	VM_GT  VMCommand = "gt"
	VM_LT  VMCommand = "lt"
	VM_AND VMCommand = "and"
	VM_OR  VMCommand = "or"
	VM_NOT VMCommand = "not"
)

type VMWriter struct {
	buf bytes.Buffer
}

func NewVMWriter() *VMWriter {
	return &VMWriter{}
}

func (vw *VMWriter) writePush(segment Segment, index int) {
	vw.buf.WriteString(fmt.Sprintf("push %s %d\n", segment, index))
}

func (vw *VMWriter) writePop(segment Segment, index int) {
	vw.buf.WriteString(fmt.Sprintf("pop %s %d\n", segment, index))
}

func (vw *VMWriter) writeArithmetic(command VMCommand) {
	vw.buf.WriteString(fmt.Sprintf("%s\n", command))
}

func (vw *VMWriter) writeLabel(label string) {
	vw.buf.WriteString(fmt.Sprintf("label %s\n", label))
}

func (vw *VMWriter) writeGoto(label string) {
	vw.buf.WriteString(fmt.Sprintf("goto %s\n", label))
}

func (vw *VMWriter) writeIf(label string) {
	vw.buf.WriteString(fmt.Sprintf("if-goto %s\n", label))
}

func (vw *VMWriter) writeCall(class, name string, nArgs int) {
	vw.buf.WriteString(fmt.Sprintf("call %s.%s %d\n", class, name, nArgs))
}

func (vw *VMWriter) writeFunction(class, name string, nLocals int) {
	vw.buf.WriteString(fmt.Sprintf("function %s.%s %d\n", class, name, nLocals))
}

func (vw *VMWriter) writeReturn() {
	vw.buf.WriteString("return\n")
}

func (vw *VMWriter) Close() []byte {
	return vw.buf.Bytes()
}
