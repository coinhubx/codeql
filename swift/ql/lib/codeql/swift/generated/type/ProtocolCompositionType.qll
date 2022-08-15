// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.type.Type

class ProtocolCompositionTypeBase extends Synth::TProtocolCompositionType, Type {
  override string getAPrimaryQlClass() { result = "ProtocolCompositionType" }

  Type getImmediateMember(int index) {
    result =
      Synth::fromRawType(Synth::toRawProtocolCompositionType(this)
            .(Raw::ProtocolCompositionType)
            .getMember(index))
  }

  final Type getMember(int index) { result = getImmediateMember(index).resolve() }

  final Type getAMember() { result = getMember(_) }

  final int getNumberOfMembers() { result = count(getAMember()) }
}
