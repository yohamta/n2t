package main

import (
	"bytes"
	"fmt"
)

type CodeWriter struct {
	file    string
	buf     *bytes.Buffer
	labelID int
}

func NewCodeWriter(file string, buf *bytes.Buffer) *CodeWriter {
	cw := &CodeWriter{file: file, buf: buf}
	cw.writeCode("// " + cw.file)
	return cw
}

func (cw *CodeWriter) WriteBootstrap() error {
	cw.writeCode("@256", "D=A", "@SP", "M=D")
	return cw.Write(Command{
		CmdType:  CmdCall,
		Function: "Sys.init",
		NArgs:    0,
	})
}

func (cw *CodeWriter) Write(cmd Command) error {
	cw.writeComment(cmd.String())
	switch cmd.CmdType {
	case CmdPush:
		cw.pushSegment(cmd.Segment, cmd.Address)
	case CmdPop:
		cw.popToSegment(cmd.Segment, cmd.Address)
	case CmdAdd:
		cw.binaryOp("D+M")
	case CmdSub:
		cw.binaryOp("M-D")
	case CmdEq:
		cw.comparison("JEQ")
	case CmdGt:
		cw.comparison("JGT")
	case CmdLt:
		cw.comparison("JLT")
	case CmdAnd:
		cw.binaryOp("D&M")
	case CmdOr:
		cw.binaryOp("D|M")
	case CmdNot:
		cw.unaryOp("!M")
	case CmdNeg:
		cw.unaryOp("-M")
	case CmdLabel:
		cw.writeLabel(cw.labelWithFilename(cmd.Label))
	case CmdIfGoto:
		cw.writeIfGoto(cw.labelWithFilename(cmd.Label))
	case CmdGoto:
		cw.writeGoto(cw.labelWithFilename(cmd.Label))
	case CmdFunction:
		cw.writeFunction(cmd.Function, cmd.NArgs)
	case CmdCall:
		cw.writeCall(cmd.Function, cmd.NArgs)
	case CmdReturn:
		cw.writeReturn()
	default:
		return fmt.Errorf("command not implemented: %v", cmd.CmdType)
	}
	return nil
}

func (cw *CodeWriter) writeComment(comment string) {
	cw.writeCode(fmt.Sprintf("\n// %s", comment))
}

func (cw *CodeWriter) writeCall(function string, nArgs int) {
	returnAddress := cw.uniqueLabel()
	cw.pushValue(returnAddress)

	cw.saveSegment(Local)
	cw.saveSegment(Argument)
	cw.saveSegment(This)
	cw.saveSegment(That)

	// reposition ARG
	cw.writeCode("@SP", "D=M", fmt.Sprintf("@%d", nArgs), "D=D-A", "@5", "D=D-A", "@ARG", "M=D")

	// reposition LCL
	cw.writeCode("@SP", "D=M", "@LCL", "M=D")

	cw.writeGoto(function)

	cw.writeLabel(returnAddress)
}

func (cw *CodeWriter) saveSegment(segment Segment) {
	cw.writeCode(fmt.Sprintf("@%s", segment.Symbol), "D=M")
	cw.pushD()
}

func (cw *CodeWriter) writeFunction(name string, nVars int) {
	cw.writeLabel(name)
	for i := 0; i < int(nVars); i++ {
		cw.pushValue("0")
	}
}

func (cw *CodeWriter) writeReturn() {
	// return address
	cw.writeCode("@LCL", "D=M", "@R13", "M=D", "@5", "A=D-A", "D=M", "@R14", "M=D")

	// reposition return value for caller
	cw.writeCode("@SP", "A=M-1", "D=M", "@ARG", "A=M", "M=D")

	// restore caller's SP
	cw.writeCode("@ARG", "D=M+1", "@SP", "M=D")

	// restore caller's THAT, THIS, ARG, LCL
	cw.restoreSegment(That, 1)
	cw.restoreSegment(This, 2)
	cw.restoreSegment(Argument, 3)
	cw.restoreSegment(Local, 4)

	// goto return address
	cw.writeCode("@R14", "A=M", "0;JMP")
}

func (cw *CodeWriter) restoreSegment(segment Segment, offset Address) {
	cw.writeCode("@R13", "D=M", fmt.Sprintf("@%d", offset), "A=D-A", "D=M", fmt.Sprintf("@%s", segment.Symbol), "M=D")
}

func (cw *CodeWriter) writeLabel(label string) {
	cw.writeCode(fmt.Sprintf("(%s)", label))
}

func (cw *CodeWriter) unaryOp(comp string) {
	cw.peek()
	cw.writeCode(fmt.Sprintf("M=%s", comp))
}

func (cw *CodeWriter) comparison(jump string) {
	cw.popToD()
	cw.peek()
	cw.writeCode("D=M-D")
	cw.decSP()

	label1 := cw.uniqueLabel()
	label2 := cw.uniqueLabel()

	// if D == 0, jump to label1
	cw.writeCode(fmt.Sprintf("@%s", label1), fmt.Sprintf("D;%s", jump), "D=0")
	cw.pushD()
	cw.writeGoto(label2)

	cw.writeLabel(label1)
	cw.writeCode("D=-1")
	cw.pushD()
	cw.writeLabel(label2)
}

func (cw *CodeWriter) binaryOp(comp string) {
	cw.popToD()
	cw.peek()
	cw.writeCode(fmt.Sprintf("M=%s", comp))
}

func (cw *CodeWriter) pushSegment(segment Segment, index Address) {
	cw.loadSegmentToD(segment, index)
	cw.pushD()
}

func (cw *CodeWriter) popToSegment(segment Segment, index Address) {
	switch segment {
	case Constant:
		panic("pop constant not allowed")
	case Temp:
		cw.writeCode(fmt.Sprintf("@R%d", index), "D=A", "@R13", "M=D")
	case Pointer:
		switch index {
		case 0:
			cw.writeCode("@THIS")
		case 1:
			cw.writeCode("@THAT")
		}
		cw.writeCode("D=A", "@R13", "M=D")
	case Static:
		cw.writeCode(fmt.Sprintf("@%s.%d", cw.file, index), "D=A", "@R13", "M=D")
	case Local, Argument, This, That:
		cw.writeCode(fmt.Sprintf("@%s", segment.Symbol), "D=M", fmt.Sprintf("@%d", index), "D=D+A", "@R13", "M=D")
	default:
		panic(fmt.Sprintf("segment not implemented: %v", segment))
	}

	cw.popToD()
	cw.writeCode("@R13", "A=M", "M=D")
}

func (cw *CodeWriter) writeIfGoto(label string) {
	cw.popToD()
	cw.writeCode(fmt.Sprintf("@%s", label), "D;JNE")
}

func (cw *CodeWriter) writeGoto(label string) {
	cw.writeCode(fmt.Sprintf("@%s", label), "0;JMP")
}

func (cw *CodeWriter) uniqueLabel() string {
	label := fmt.Sprintf("L_%s.%d", cw.file, cw.labelID)
	cw.labelID++
	return label
}

func (cw *CodeWriter) labelWithFilename(label string) string {
	return fmt.Sprintf("%s$%s", cw.file, label)
}

func (cw *CodeWriter) Close() {
	label := cw.uniqueLabel()
	cw.writeLabel(label)
	cw.writeGoto(label)
}

func (cw *CodeWriter) loadSegmentToD(segment Segment, index Address) {
	switch segment {
	case Constant:
		cw.writeCode(fmt.Sprintf("@%d", index), "D=A")
	case Temp:
		cw.writeCode(fmt.Sprintf("@R%d", index), "D=M")
	case Pointer:
		switch index {
		case 0:
			cw.writeCode("@THIS")
		case 1:
			cw.writeCode("@THAT")
		}
		cw.writeCode("D=M")
	case Static:
		cw.writeCode(fmt.Sprintf("@%s.%d", cw.file, index), "D=M")
	case Local, Argument, This, That:
		cw.writeCode(fmt.Sprintf("@%s", segment.Symbol), "D=M", fmt.Sprintf("@%d", index), "A=D+A", "D=M")
	default:
		panic(fmt.Sprintf("segment not implemented: %v", segment))
	}
}

func (cw *CodeWriter) pushD() {
	cw.writeCode("@SP", "A=M", "M=D", "@SP", "M=M+1")
}

func (cw *CodeWriter) pushValue(value string) {
	cw.writeCode(fmt.Sprintf("@%s", value), "D=A")
	cw.pushD()
}

func (cw *CodeWriter) decSP() {
	cw.writeCode("@SP", "M=M-1")
}

func (cw *CodeWriter) popToD() {
	cw.writeCode("@SP", "AM=M-1", "D=M")
}

func (cw *CodeWriter) peek() {
	cw.writeCode("@SP", "A=M-1")
}

func (cw *CodeWriter) writeCode(ops ...string) {
	for _, op := range ops {
		cw.buf.WriteString(op)
		cw.buf.WriteString("\n")
	}
}
