package main

import (
	"fmt"
	"io/ioutil"
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

	target := os.Args[1]

	var files []string

	// check if the target is a file or a directory
	// if it's a file, just assemble it
	// if it's a directory, assemble all the .vm files in it
	// and write bootstrapping code (call Sys.init) at the beginning.
	if hasJackExtension(target) {
		files = append(files, target)
	} else {
		var err error
		files, err = findJackFiles(target)
		if err != nil {
			log.Fatalf("failed to get files: %v", err)
		}
		if len(files) == 0 {
			log.Fatalf("there's no input file")
		}
	}

	for _, file := range files {
		fileContent, err := readFileContent(file)
		if err != nil {
			log.Fatalf("failed to read program: %v", err)
		}
		ast, err := NewParser(fileContent).Parse()
		if err != nil {
			log.Fatalf("failed to parse program: %v", err)
		}
		code, err := NewCompiler().Compile(ast)
		if err != nil {
			log.Fatalf("failed to compile program: %v", err)
		}
		if err := saveVMFile(getVMFilename(file), code); err != nil {
			log.Fatalf("failed to write VM file: %v", err)
		}
	}
}

func hasJackExtension(path string) bool {
	return filepath.Ext(path) == ".jack"
}

func findJackFiles(dir string) ([]string, error) {
	var files []string
	err := filepath.Walk(dir, func(path string, info os.FileInfo, err error) error {
		if err != nil {
			return err
		}
		if !info.IsDir() && filepath.Ext(path) == ".jack" {
			files = append(files, path)
		}
		return nil
	})
	if err != nil {
		return nil, fmt.Errorf("failed to walk directory: %w", err)
	}
	return files, nil
}

func readFileContent(filePath string) ([]byte, error) {
	file, err := os.Open(filePath)
	if err != nil {
		return nil, fmt.Errorf("failed to open file: %w", err)
	}
	defer func() {
		_ = file.Close()
	}()
	// ioutil.ReadAll is deprecated, but it's necessary
	// for passing the test in coursera where it uses old version of Go
	data, err := ioutil.ReadAll(file)
	if err != nil {
		return nil, fmt.Errorf("failed to read file: %w", err)
	}
	return data, nil
}

func getVMFilename(source string) string {
	return filepath.Join(strings.TrimSuffix(source, filepath.Ext(source)) + ".vm")
}

func saveVMFile(filePath string, code []byte) error {
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
	if _, err := f.Write(code); err != nil {
		return err
	}
	return nil
}
