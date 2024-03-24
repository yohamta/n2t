package main

import (
	"fmt"
	"strconv"
)

const (
	numRegisters = 16
	wordSize     = 16
)

type Address int

func ParseAddress(s string) (Address, error) {
	i, err := strconv.ParseInt(s, 10, wordSize)
	if err != nil {
		return 0, err
	}
	return Address(i), nil
}

type SymbolTable struct {
	store       map[string]Address
	nextAddress Address
}

func NewSymbolTable() *SymbolTable {
	st := &SymbolTable{
		store: make(map[string]Address),
	}
	st.addPredefinedSymbols()
	st.nextAddress = numRegisters
	return st
}

func (s *SymbolTable) Contains(symbol string) bool {
	_, ok := s.store[symbol]
	return ok
}

func (s *SymbolTable) addPredefinedSymbols() {
	s.store["SP"] = 0
	s.store["LCL"] = 1
	s.store["ARG"] = 2
	s.store["THIS"] = 3
	s.store["THAT"] = 4
	s.store["SCREEN"] = 16384
	s.store["KBD"] = 24576
	for i := 0; i < numRegisters; i++ {
		s.store[fmt.Sprintf("R%d", i)] = Address(i)
	}
}

func (s *SymbolTable) Dump() {
	for k, v := range s.store {
		println(k, v)
	}
}

func (s *SymbolTable) AddVariable(symbol string) {
	s.store[symbol] = s.nextAddress
	s.nextAddress++
}

func (s *SymbolTable) AddLabel(symbol string, address Address) {
	s.store[symbol] = address
}

func (s *SymbolTable) GetAddress(symbol string) (Address, error) {
	if !s.Contains(symbol) {
		return 0, fmt.Errorf("symbol %s not found", symbol)
	}
	return s.store[symbol], nil
}
