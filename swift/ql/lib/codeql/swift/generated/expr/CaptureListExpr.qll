// generated by codegen/codegen.py
private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.expr.ClosureExpr
import codeql.swift.elements.expr.Expr
import codeql.swift.elements.decl.PatternBindingDecl

class CaptureListExprBase extends Synth::TCaptureListExpr, Expr {
  override string getAPrimaryQlClass() { result = "CaptureListExpr" }

  PatternBindingDecl getImmediateBindingDecl(int index) {
    result =
      Synth::fromRawPatternBindingDecl(Synth::toRawCaptureListExpr(this)
            .(Raw::CaptureListExpr)
            .getBindingDecl(index))
  }

  final PatternBindingDecl getBindingDecl(int index) {
    result = getImmediateBindingDecl(index).resolve()
  }

  final PatternBindingDecl getABindingDecl() { result = getBindingDecl(_) }

  final int getNumberOfBindingDecls() { result = count(getABindingDecl()) }

  ClosureExpr getImmediateClosureBody() {
    result =
      Synth::fromRawClosureExpr(Synth::toRawCaptureListExpr(this)
            .(Raw::CaptureListExpr)
            .getClosureBody())
  }

  final ClosureExpr getClosureBody() { result = getImmediateClosureBody().resolve() }
}
