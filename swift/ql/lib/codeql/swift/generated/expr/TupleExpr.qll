// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.Expr

class TupleExprBase extends Synth::TTupleExpr, Expr {
  override string getAPrimaryQlClass() { result = "TupleExpr" }

  Expr getImmediateElement(int index) {
    result = Synth::fromRawExpr(Synth::toRawTupleExpr(this).(Raw::TupleExpr).getElement(index))
  }

  final Expr getElement(int index) { result = getImmediateElement(index).resolve() }

  final Expr getAnElement() { result = getElement(_) }

  final int getNumberOfElements() { result = count(getAnElement()) }
}
