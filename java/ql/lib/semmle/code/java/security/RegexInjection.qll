/** Provides classes and predicates related to regex injection in Java. */

import java
private import semmle.code.java.dataflow.DataFlow
private import semmle.code.java.frameworks.Regex
private import semmle.code.java.frameworks.apache.Lang

/** A data flow sink for untrusted user input used to construct regular expressions. */
abstract class Sink extends DataFlow::ExprNode { }

/** A sanitizer for untrusted user input used to construct regular expressions. */
abstract class Sanitizer extends DataFlow::ExprNode { }

private class RegexInjectionSink extends Sink {
  RegexInjectionSink() {
    exists(MethodAccess ma, Method m | m = ma.getMethod() |
      ma.getArgument(0) = this.asExpr() and
      (
        m instanceof StringRegexMethod or
        m instanceof PatternRegexMethod
      )
      or
      ma.getArgument(1) = this.asExpr() and
      m instanceof ApacheRegExUtilsMethod
    )
  }
}

/** A call to a function which escapes regular expression meta-characters. */
private class RegexInjectionSanitizer extends Sanitizer {
  RegexInjectionSanitizer() {
    // a function whose name suggests that it escapes regular expression meta-characters
    exists(string calleeName, string sanitize, string regexp |
      calleeName = this.asExpr().(Call).getCallee().getName() and
      sanitize = "(?:escape|saniti[sz]e)" and
      regexp = "regexp?"
    |
      calleeName
          .regexpMatch("(?i)(" + sanitize + ".*" + regexp + ".*)" + "|(" + regexp + ".*" + sanitize +
              ".*)")
    )
    or
    // a call to the `Pattern.quote` method, which gives metacharacters or escape sequences no special meaning
    exists(MethodAccess ma, Method m | m = ma.getMethod() |
      ma.getArgument(0) = this.asExpr() and
      m instanceof PatternQuoteMethod
    )
    or
    // use of Pattern.LITERAL flag with `Pattern.compile` which gives metacharacters or escape sequences no special meaning
    exists(MethodAccess ma, Method m, Field field | m = ma.getMethod() |
      ma.getArgument(0) = this.asExpr() and
      m instanceof PatternRegexMethod and
      m.hasName("compile") and
      //ma.getArgument(1).toString() = "Pattern.LITERAL" and
      field instanceof PatternLiteral and
      ma.getArgument(1) = field.getAnAccess()
    )
  }
}

/**
 * The methods of the class `java.lang.String` that take a regular expression
 * as a parameter.
 */
private class StringRegexMethod extends Method {
  StringRegexMethod() {
    this.getDeclaringType() instanceof TypeString and
    this.hasName(["matches", "split", "replaceFirst", "replaceAll"])
  }
}

/**
 * The methods of the class `java.util.regex.Pattern` that take a regular
 * expression as a parameter.
 */
private class PatternRegexMethod extends Method {
  PatternRegexMethod() {
    this.getDeclaringType() instanceof TypeRegexPattern and
    this.hasName(["compile", "matches"])
  }
}

/** The `quote` method of the `java.util.regex.Pattern` class. */
private class PatternQuoteMethod extends Method {
  PatternQuoteMethod() { this.hasName(["quote"]) }
}

/** The `LITERAL` field of the `java.util.regex.Pattern` class. */
private class PatternLiteral extends Field {
  PatternLiteral() {
    this.getDeclaringType() instanceof TypeRegexPattern and
    this.hasName("LITERAL")
  }
}

/**
 * The methods of the class `org.apache.commons.lang3.RegExUtils` that take
 * a regular expression of type `String` as a parameter.
 */
private class ApacheRegExUtilsMethod extends Method {
  ApacheRegExUtilsMethod() {
    this.getDeclaringType() instanceof TypeApacheRegExUtils and
    // only handles String param here because the other param option, Pattern, is already handled by `java.util.regex.Pattern`
    this.getParameterType(1) instanceof TypeString and
    this.hasName([
        "removeAll", "removeFirst", "removePattern", "replaceAll", "replaceFirst", "replacePattern"
      ])
  }
}
