// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.Expr

class UnresolvedDotExprBase extends Synth::TUnresolvedDotExpr, Expr {
  override string getAPrimaryQlClass() { result = "UnresolvedDotExpr" }

  Expr getImmediateBase() {
    result =
      Synth::fromRawExpr(Synth::toRawUnresolvedDotExpr(this).(Raw::UnresolvedDotExpr).getBase())
  }

  final Expr getBase() { result = getImmediateBase().resolve() }

  string getName() {
    result = Synth::toRawUnresolvedDotExpr(this).(Raw::UnresolvedDotExpr).getName()
  }
}
