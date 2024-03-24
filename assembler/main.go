package main

import (
	"fmt"
	"io"
	"log"
	"os"
	"path/filepath"
	"strings"
)

func main() {
	if len(os.Args) < 2 {
		fmt.Printf("usage: %s <file>\n", os.Args[0])
		return
	}
	program, err := readProgram(os.Args[1])
	if err != nil {
		log.Fatalf("failed to read program: %v", err)
	}
	assembler := NewAssembler(program)
	codes, err := assembler.Assemble()
	if err != nil {
		log.Fatalf("failed to assemble program: %v", err)
	}
	if err := writeFile(hackFileName(os.Args[1]), codes); err != nil {
		log.Fatalf("failed to write file: %v", err)
	}
}

func readProgram(filePath string) ([]byte, error) {
	file, err := os.Open(filePath)
	if err != nil {
		return nil, fmt.Errorf("failed to open file: %w", err)
	}
	defer func() {
		_ = file.Close()
	}()
	data, err := io.ReadAll(file)
	if err != nil {
		return nil, fmt.Errorf("failed to read file: %w", err)
	}
	return data, nil
}

func hackFileName(source string) string {
	return filepath.Join(strings.TrimSuffix(source, filepath.Ext(source)) + ".hack")
}

func writeFile(filePath string, codes []string) error {
	log.Printf("writing file: %s\n", filePath)
	// delete if exist
	if err := os.Remove(filePath); err != nil && !os.IsNotExist(err) {
		return err
	}
	// create file
	f, err := os.Create(filePath)
	if err != nil {
		return err
	}
	defer func() {
		_ = f.Close()
	}()
	for _, code := range codes {
		if _, err := fmt.Fprintln(f, code); err != nil {
			return err
		}
	}
	log.Printf("file written: %s\n", filePath)
	return nil
}
