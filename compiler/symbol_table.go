package main

type SymbolKind string

const (
	S_NONE   SymbolKind = ""
	S_STATIC SymbolKind = "static"
	S_FIELD  SymbolKind = "field"
	S_ARG    SymbolKind = "argument"
	S_VAR    SymbolKind = "var"
)

type Scope string

const (
	S_CLASS       Scope = "class"
	S_CONSTRUCTOR Scope = "constructor"
	S_FUNCTION    Scope = "function"
	S_METHOD      Scope = "method"
)

type Symbol struct {
	Name  string
	Type  string
	Kind  SymbolKind
	Index int
}

type SymbolTable struct {
	outer *SymbolTable
	store map[string]Symbol
	nums  map[SymbolKind]int
	scope Scope
}

func NewSymbolTable(scope Scope) *SymbolTable {
	return &SymbolTable{
		store: map[string]Symbol{},
		nums:  map[SymbolKind]int{},
		scope: scope,
	}
}

func NewSubSymbolTable(outer *SymbolTable, scope Scope) *SymbolTable {
	return &SymbolTable{
		outer: outer,
		store: map[string]Symbol{},
		nums:  map[SymbolKind]int{},
		scope: scope,
	}
}

func (s *SymbolTable) Define(name string, typ string, k SymbolKind) {
	s.store[name] = Symbol{
		Name:  name,
		Type:  typ,
		Kind:  k,
		Index: s.nums[k],
	}
	s.nums[k]++
}

func (s *SymbolTable) VarCount(k SymbolKind) int {
	return s.nums[k]
}

func (s *SymbolTable) TypeOf(name string) (string, bool) {
	sym, ok := s.resolve(name)
	if !ok {
		return "", false
	}
	return sym.Type, true
}

func (s *SymbolTable) KindOf(name string) SymbolKind {
	sym, ok := s.resolve(name)
	if !ok {
		return S_NONE
	}
	return sym.Kind
}

func (s *SymbolTable) IndexOf(name string) (int, bool) {
	sym, ok := s.resolve(name)
	if !ok {
		return 0, false
	}
	return sym.Index, true
}

func (s *SymbolTable) resolve(name string) (Symbol, bool) {
	sym, ok := s.store[name]
	if ok {
		return sym, ok
	}
	if s.outer != nil {
		return s.outer.resolve(name)
	}
	return Symbol{}, false
}
