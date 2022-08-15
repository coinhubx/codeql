// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.pattern.Pattern

class OptionalSomePatternBase extends Synth::TOptionalSomePattern, Pattern {
  override string getAPrimaryQlClass() { result = "OptionalSomePattern" }

  Pattern getImmediateSubPattern() {
    result =
      Synth::fromRawPattern(Synth::toRawOptionalSomePattern(this)
            .(Raw::OptionalSomePattern)
            .getSubPattern())
  }

  final Pattern getSubPattern() { result = getImmediateSubPattern().resolve() }
}
