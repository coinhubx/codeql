// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.type.SyntaxSugarType
import codeql.swift.elements.type.Type

class DictionaryTypeBase extends Synth::TDictionaryType, SyntaxSugarType {
  override string getAPrimaryQlClass() { result = "DictionaryType" }

  Type getImmediateKeyType() {
    result = Synth::fromRawType(Synth::toRawDictionaryType(this).(Raw::DictionaryType).getKeyType())
  }

  final Type getKeyType() { result = getImmediateKeyType().resolve() }

  Type getImmediateValueType() {
    result =
      Synth::fromRawType(Synth::toRawDictionaryType(this).(Raw::DictionaryType).getValueType())
  }

  final Type getValueType() { result = getImmediateValueType().resolve() }
}
