// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.stmt.Stmt

class BreakStmtBase extends Synth::TBreakStmt, Stmt {
  override string getAPrimaryQlClass() { result = "BreakStmt" }

  string getTargetName() { result = Synth::toRawBreakStmt(this).(Raw::BreakStmt).getTargetName() }

  final predicate hasTargetName() { exists(getTargetName()) }

  Stmt getImmediateTarget() {
    result = Synth::fromRawStmt(Synth::toRawBreakStmt(this).(Raw::BreakStmt).getTarget())
  }

  final Stmt getTarget() { result = getImmediateTarget().resolve() }

  final predicate hasTarget() { exists(getTarget()) }
}
