// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.expr.OpaqueValueExpr

class MakeTemporarilyEscapableExprBase extends Synth::TMakeTemporarilyEscapableExpr, Expr {
  override string getAPrimaryQlClass() { result = "MakeTemporarilyEscapableExpr" }

  OpaqueValueExpr getImmediateEscapingClosure() {
    result =
      Synth::fromRawOpaqueValueExpr(Synth::toRawMakeTemporarilyEscapableExpr(this)
            .(Raw::MakeTemporarilyEscapableExpr)
            .getEscapingClosure())
  }

  final OpaqueValueExpr getEscapingClosure() { result = getImmediateEscapingClosure().resolve() }

  Expr getImmediateNonescapingClosure() {
    result =
      Synth::fromRawExpr(Synth::toRawMakeTemporarilyEscapableExpr(this)
            .(Raw::MakeTemporarilyEscapableExpr)
            .getNonescapingClosure())
  }

  final Expr getNonescapingClosure() { result = getImmediateNonescapingClosure().resolve() }

  Expr getImmediateSubExpr() {
    result =
      Synth::fromRawExpr(Synth::toRawMakeTemporarilyEscapableExpr(this)
            .(Raw::MakeTemporarilyEscapableExpr)
            .getSubExpr())
  }

  final Expr getSubExpr() { result = getImmediateSubExpr().resolve() }
}
