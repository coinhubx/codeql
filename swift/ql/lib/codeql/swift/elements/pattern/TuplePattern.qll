private import codeql.swift.generated.pattern.TuplePattern

class TuplePattern extends TuplePatternBase {
  Pattern getFirstElement() { result = this.getElement(0) }

  Pattern getLastElement() {
    exists(int i |
      result = this.getElement(i) and
      not exists(this.getElement(i + 1))
    )
  }
}
