// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.stmt.LabeledStmt
import codeql.swift.elements.stmt.StmtCondition

class LabeledConditionalStmtBase extends Synth::TLabeledConditionalStmt, LabeledStmt {
  StmtCondition getImmediateCondition() {
    result =
      Synth::fromRawStmtCondition(Synth::toRawLabeledConditionalStmt(this)
            .(Raw::LabeledConditionalStmt)
            .getCondition())
  }

  final StmtCondition getCondition() { result = getImmediateCondition().resolve() }
}
