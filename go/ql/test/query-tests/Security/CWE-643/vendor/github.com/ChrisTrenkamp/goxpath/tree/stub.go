// Code generated by depstubber. DO NOT EDIT.
// This is a simple stub for github.com/ChrisTrenkamp/goxpath/tree, strictly for use in testing.

// See the LICENSE file for information about the licensing of the original library.
// Source: github.com/ChrisTrenkamp/goxpath/tree (exports: Node,String; functions: )

// Package tree is a stub of github.com/ChrisTrenkamp/goxpath/tree, generated by depstubber.
package tree

import (
	xml "encoding/xml"
)

type Bool bool

func (_ Bool) Bool() Bool {
	return false
}

func (_ Bool) Num() Num {
	return 0
}

func (_ Bool) String() string {
	return ""
}

type Elem interface {
	GetAttrs() []Node
	GetChildren() []Node
	GetNodeType() NodeType
	GetParent() Elem
	GetToken() xml.Token
	Pos() int
	ResValue() string
}

type Node interface {
	GetNodeType() NodeType
	GetParent() Elem
	GetToken() xml.Token
	Pos() int
	ResValue() string
}

type NodeType int

func (_ NodeType) GetNodeType() NodeType {
	return 0
}

type Num float64

func (_ Num) Bool() Bool {
	return false
}

func (_ Num) Num() Num {
	return 0
}

func (_ Num) String() string {
	return ""
}

type String string

func (_ String) Bool() Bool {
	return false
}

func (_ String) Num() Num {
	return 0
}

func (_ String) String() string {
	return ""
}
