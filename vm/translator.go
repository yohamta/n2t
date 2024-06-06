package main

import (
	"bytes"
	"fmt"
)

type Translator struct {
	buf *bytes.Buffer
}

func NewTranslator(bootstrap bool) (*Translator, error) {
	var buf bytes.Buffer
	if bootstrap {
		// if bootstrapping is enabled, write the boot code
		writer := NewCodeWriter("boot", &buf)
		if err := writer.WriteBootstrap(); err != nil {
			return nil, fmt.Errorf("failed to write boot code: %v", err)
		}
		writer.Close()
	}
	return &Translator{&buf}, nil
}

func (t *Translator) Translate(name string, program []byte) error {
	writer := NewCodeWriter(name, t.buf)
	parser := NewParser(program)
	for parser.HasMoreCommands() {
		cmd, err := parser.Advance()
		if err != nil {
			return fmt.Errorf("failed to parse command: %v", err)
		}
		if cmd.CmdType == CmdComment {
			continue
		}
		if err := writer.Write(cmd); err != nil {
			return fmt.Errorf("failed to write command: %v", err)
		}
	}
	writer.Close()
	return nil
}

func (t *Translator) Assembly() string {
	return t.buf.String()
}
