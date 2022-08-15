// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.decl.Decl
import codeql.swift.elements.type.Type

class AnyGenericTypeBase extends Synth::TAnyGenericType, Type {
  Type getImmediateParent() {
    result = Synth::fromRawType(Synth::toRawAnyGenericType(this).(Raw::AnyGenericType).getParent())
  }

  final Type getParent() { result = getImmediateParent().resolve() }

  final predicate hasParent() { exists(getParent()) }

  Decl getImmediateDeclaration() {
    result =
      Synth::fromRawDecl(Synth::toRawAnyGenericType(this).(Raw::AnyGenericType).getDeclaration())
  }

  final Decl getDeclaration() { result = getImmediateDeclaration().resolve() }
}
