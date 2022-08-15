// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.stmt.Stmt

class ThrowStmtBase extends Synth::TThrowStmt, Stmt {
  override string getAPrimaryQlClass() { result = "ThrowStmt" }

  Expr getImmediateSubExpr() {
    result = Synth::fromRawExpr(Synth::toRawThrowStmt(this).(Raw::ThrowStmt).getSubExpr())
  }

  final Expr getSubExpr() { result = getImmediateSubExpr().resolve() }
}
