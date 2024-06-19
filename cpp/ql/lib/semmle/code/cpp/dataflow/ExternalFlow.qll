/**
 * INTERNAL use only. This is an experimental API subject to change without notice.
 *
 * Provides classes and predicates for dealing with flow models specified in CSV format.
 *
 * The CSV specification has the following columns:
 * - Sources:
 *   `namespace; type; subtypes; name; signature; ext; output; kind`
 * - Sinks:
 *   `namespace; type; subtypes; name; signature; ext; input; kind`
 * - Summaries:
 *   `namespace; type; subtypes; name; signature; ext; input; output; kind`
 *
 * The interpretation of a row is similar to API-graphs with a left-to-right
 * reading.
 * 1. The `namespace` column selects a namespace.
 * 2. The `type` column selects a type within that namespace.
 * 3. The `subtypes` is a boolean that indicates whether to jump to an
 *    arbitrary subtype of that type. Set this to `false` if leaving the `type`
 *    blank (for example, a free function).
 * 4. The `name` column optionally selects a specific named member of the type.
 * 5. The `signature` column optionally restricts the named member. If
 *    `signature` is blank then no such filtering is done. The format of the
 *    signature is a comma-separated list of types enclosed in parentheses. The
 *    types can be short names or fully qualified names (mixing these two options
 *    is not allowed within a single signature).
 * 6. The `ext` column specifies additional API-graph-like edges. Currently
 *    there is only one valid value: "".
 * 7. The `input` column specifies how data enters the element selected by the
 *    first 6 columns, and the `output` column specifies how data leaves the
 *    element selected by the first 6 columns. An `input` can be either:
 *    - "": Selects a write to the selected element in case this is a field.
 *    - "Argument[n]": Selects an argument in a call to the selected element.
 *      The arguments are zero-indexed, and `-1` specifies the qualifier object,
 *      that is, `*this`.
 *      - one or more "*" can be added in front of the argument index to indicate
 *        indirection, for example, `Argument[*0]` indicates the first indirection
 *        of the 0th argument.
 *      - `n1..n2` syntax can be used to indicate a range of arguments, inclusive
 *        at both ends. One or more "*"s can be added in front of the whole range
 *        to indicate that every argument in the range is indirect, for example
 *        `*0..1` is the first indirection of both arguments 0 and 1.
 *    - "ReturnValue": Selects a value being returned by the selected element.
 *      One or more "*" can be added as an argument to indicate indirection, for
 *      example, "ReturnValue[*]" indicates the first indirection of the return
 *      value.
 *
 *    An `output` can be either:
 *    - "": Selects a read of a selected field.
 *    - "Argument[n]": Selects the post-update value of an argument in a call to
 *      the selected element. That is, the value of the argument after the call
 *      returns. The arguments are zero-indexed, and `-1` specifies the qualifier
 *      object, that is, `*this`.
 *      - one or more "*" can be added in front of the argument index to indicate
 *        indirection, for example, `Argument[*0]` indicates the first indirection
 *        of the 0th argument.
 *      - `n1..n2` syntax can be used to indicate a range of arguments, inclusive
 *        at both ends. One or more "*"s can be added in front of the whole range
 *        to indicate that every argument in the range is indirect, for example
 *        `*0..1` is the first indirection of both arguments 0 and 1.
 *    - "Parameter[n]": Selects the value of a parameter of the selected element.
 *      The syntax is the same as for "Argument", for example "Parameter[0]",
 *      "Parameter[*0]", "Parameter[0..2]" etc.
 *    - "ReturnValue": Selects a value being returned by the selected element.
 *      One or more "*" can be added as an argument to indicate indirection, for
 *      example, "ReturnValue[*]" indicates the first indirection of the return
 *      value.
 * 8. The `kind` column is a tag that can be referenced from QL to determine to
 *    which classes the interpreted elements should be added. For example, for
 *    sources "remote" indicates a default remote flow source, and for summaries
 *    "taint" indicates a default additional taint step and "value" indicates a
 *    globally applicable value-preserving step.
 */

import cpp
private import new.DataFlow
private import semmle.code.cpp.ir.dataflow.internal.DataFlowPrivate as Private
private import semmle.code.cpp.ir.dataflow.internal.DataFlowUtil
private import internal.FlowSummaryImpl
private import internal.FlowSummaryImpl::Public
private import internal.FlowSummaryImpl::Private
private import internal.FlowSummaryImpl::Private::External
private import internal.ExternalFlowExtensions as Extensions
private import codeql.mad.ModelValidation as SharedModelVal
private import codeql.util.Unit

/**
 * A unit class for adding additional source model rows.
 *
 * Extend this class to add additional source definitions.
 */
class SourceModelCsv extends Unit {
  /** Holds if `row` specifies a source definition. */
  abstract predicate row(string row);
}

/**
 * A unit class for adding additional sink model rows.
 *
 * Extend this class to add additional sink definitions.
 */
class SinkModelCsv extends Unit {
  /** Holds if `row` specifies a sink definition. */
  abstract predicate row(string row);
}

/**
 * A unit class for adding additional summary model rows.
 *
 * Extend this class to add additional flow summary definitions.
 */
class SummaryModelCsv extends Unit {
  /** Holds if `row` specifies a summary definition. */
  abstract predicate row(string row);
}

/** Holds if `row` is a source model. */
predicate sourceModel(string row) { any(SourceModelCsv s).row(row) }

/** Holds if `row` is a sink model. */
predicate sinkModel(string row) { any(SinkModelCsv s).row(row) }

/** Holds if `row` is a summary model. */
predicate summaryModel(string row) { any(SummaryModelCsv s).row(row) }

/** Holds if a source model exists for the given parameters. */
predicate sourceModel(
  string namespace, string type, boolean subtypes, string name, string signature, string ext,
  string output, string kind, string provenance
) {
  exists(string row |
    sourceModel(row) and
    row.splitAt(";", 0) = namespace and
    row.splitAt(";", 1) = type and
    row.splitAt(";", 2) = subtypes.toString() and
    subtypes = [true, false] and
    row.splitAt(";", 3) = name and
    row.splitAt(";", 4) = signature and
    row.splitAt(";", 5) = ext and
    row.splitAt(";", 6) = output and
    row.splitAt(";", 7) = kind
  ) and
  provenance = "manual"
  or
  Extensions::sourceModel(namespace, type, subtypes, name, signature, ext, output, kind, provenance,
    _)
}

/** Holds if a sink model exists for the given parameters. */
predicate sinkModel(
  string namespace, string type, boolean subtypes, string name, string signature, string ext,
  string input, string kind, string provenance
) {
  exists(string row |
    sinkModel(row) and
    row.splitAt(";", 0) = namespace and
    row.splitAt(";", 1) = type and
    row.splitAt(";", 2) = subtypes.toString() and
    subtypes = [true, false] and
    row.splitAt(";", 3) = name and
    row.splitAt(";", 4) = signature and
    row.splitAt(";", 5) = ext and
    row.splitAt(";", 6) = input and
    row.splitAt(";", 7) = kind
  ) and
  provenance = "manual"
  or
  Extensions::sinkModel(namespace, type, subtypes, name, signature, ext, input, kind, provenance, _)
}

/**
 * Holds if a summary model exists for the given parameters.
 *
 * This predicate does not expand `@` to `*`s.
 */
private predicate summaryModel0(
  string namespace, string type, boolean subtypes, string name, string signature, string ext,
  string input, string output, string kind, string provenance
) {
  exists(string row |
    summaryModel(row) and
    row.splitAt(";", 0) = namespace and
    row.splitAt(";", 1) = type and
    row.splitAt(";", 2) = subtypes.toString() and
    subtypes = [true, false] and
    row.splitAt(";", 3) = name and
    row.splitAt(";", 4) = signature and
    row.splitAt(";", 5) = ext and
    row.splitAt(";", 6) = input and
    row.splitAt(";", 7) = output and
    row.splitAt(";", 8) = kind
  ) and
  provenance = "manual"
  or
  Extensions::summaryModel(namespace, type, subtypes, name, signature, ext, input, output, kind,
    provenance, _)
}

/**
 * Holds if `input` is `input0`, but with all occurences of `@` replaced
 * by `n` repetitions of `*` (and similarly for `output` and `output0`).
 */
bindingset[input0, output0, n]
pragma[inline_late]
private predicate expandInputAndOutput(
  string input0, string input, string output0, string output, int n
) {
  input = input0.replaceAll("@", repeatStars(n)) and
  output = output0.replaceAll("@", repeatStars(n))
}

/**
 * Holds if a summary model exists for the given parameters.
 */
predicate summaryModel(
  string namespace, string type, boolean subtypes, string name, string signature, string ext,
  string input, string output, string kind, string provenance
) {
  exists(string input0, string output0 |
    summaryModel0(namespace, type, subtypes, name, signature, ext, input0, output0, kind, provenance) and
    expandInputAndOutput(input0, input, output0, output,
      [0 .. Private::getMaxElementContentIndirectionIndex() - 1])
  )
}

private predicate relevantNamespace(string namespace) {
  sourceModel(namespace, _, _, _, _, _, _, _, _) or
  sinkModel(namespace, _, _, _, _, _, _, _, _) or
  summaryModel(namespace, _, _, _, _, _, _, _, _, _)
}

private predicate namespaceLink(string shortns, string longns) {
  relevantNamespace(shortns) and
  relevantNamespace(longns) and
  longns.prefix(longns.indexOf("::")) = shortns
}

private predicate canonicalNamespace(string namespace) {
  relevantNamespace(namespace) and not namespaceLink(_, namespace)
}

private predicate canonicalNamespaceLink(string namespace, string subns) {
  canonicalNamespace(namespace) and
  (subns = namespace or namespaceLink(namespace, subns))
}

/**
 * Holds if MaD framework coverage of `namespace` is `n` api endpoints of the
 * kind `(kind, part)`, and `namespaces` is the number of subnamespaces of
 * `namespace` which have MaD framework coverage (including `namespace`
 * itself).
 */
predicate modelCoverage(string namespace, int namespaces, string kind, string part, int n) {
  namespaces = strictcount(string subns | canonicalNamespaceLink(namespace, subns)) and
  (
    part = "source" and
    n =
      strictcount(string subns, string type, boolean subtypes, string name, string signature,
        string ext, string output, string provenance |
        canonicalNamespaceLink(namespace, subns) and
        sourceModel(subns, type, subtypes, name, signature, ext, output, kind, provenance)
      )
    or
    part = "sink" and
    n =
      strictcount(string subns, string type, boolean subtypes, string name, string signature,
        string ext, string input, string provenance |
        canonicalNamespaceLink(namespace, subns) and
        sinkModel(subns, type, subtypes, name, signature, ext, input, kind, provenance)
      )
    or
    part = "summary" and
    n =
      strictcount(string subns, string type, boolean subtypes, string name, string signature,
        string ext, string input, string output, string provenance |
        canonicalNamespaceLink(namespace, subns) and
        summaryModel(subns, type, subtypes, name, signature, ext, input, output, kind, provenance)
      )
  )
}

/** Provides a query predicate to check the CSV data for validation errors. */
module CsvValidation {
  private string getInvalidModelInput() {
    exists(string pred, AccessPath input, string part |
      sinkModel(_, _, _, _, _, _, input, _, _) and pred = "sink"
      or
      summaryModel(_, _, _, _, _, _, input, _, _, _) and pred = "summary"
    |
      (
        invalidSpecComponent(input, part) and
        not part = "" and
        not (part = "Argument" and pred = "sink") and
        not parseArg(part, _)
        or
        part = input.getToken(_) and
        parseParam(part, _)
      ) and
      result = "Unrecognized input specification \"" + part + "\" in " + pred + " model."
    )
  }

  private string getInvalidModelOutput() {
    exists(string pred, string output, string part |
      sourceModel(_, _, _, _, _, _, output, _, _) and pred = "source"
      or
      summaryModel(_, _, _, _, _, _, _, output, _, _) and pred = "summary"
    |
      invalidSpecComponent(output, part) and
      not part = "" and
      not (part = ["Argument", "Parameter"] and pred = "source") and
      result = "Unrecognized output specification \"" + part + "\" in " + pred + " model."
    )
  }

  private module KindValConfig implements SharedModelVal::KindValidationConfigSig {
    predicate summaryKind(string kind) { summaryModel(_, _, _, _, _, _, _, _, kind, _) }

    predicate sinkKind(string kind) { sinkModel(_, _, _, _, _, _, _, kind, _) }

    predicate sourceKind(string kind) { sourceModel(_, _, _, _, _, _, _, kind, _) }
  }

  private module KindVal = SharedModelVal::KindValidation<KindValConfig>;

  private string getInvalidModelSubtype() {
    exists(string pred, string row |
      sourceModel(row) and pred = "source"
      or
      sinkModel(row) and pred = "sink"
      or
      summaryModel(row) and pred = "summary"
    |
      exists(string b |
        b = row.splitAt(";", 2) and
        not b = ["true", "false"] and
        result = "Invalid boolean \"" + b + "\" in " + pred + " model."
      )
    )
  }

  private string getInvalidModelColumnCount() {
    exists(string pred, string row, int expect |
      sourceModel(row) and expect = 8 and pred = "source"
      or
      sinkModel(row) and expect = 8 and pred = "sink"
      or
      summaryModel(row) and expect = 9 and pred = "summary"
    |
      exists(int cols |
        cols = 1 + max(int n | exists(row.splitAt(";", n))) and
        cols != expect and
        result =
          "Wrong number of columns in " + pred + " model row, expected " + expect + ", got " + cols +
            "."
      )
    )
  }

  private string getInvalidModelSignature() {
    exists(string pred, string namespace, string type, string name, string signature, string ext |
      sourceModel(namespace, type, _, name, signature, ext, _, _, _) and pred = "source"
      or
      sinkModel(namespace, type, _, name, signature, ext, _, _, _) and pred = "sink"
      or
      summaryModel(namespace, type, _, name, signature, ext, _, _, _, _) and pred = "summary"
    |
      not namespace.regexpMatch("[a-zA-Z0-9_\\.:]*") and
      result = "Dubious namespace \"" + namespace + "\" in " + pred + " model."
      or
      not type.regexpMatch("[a-zA-Z0-9_<>,\\+]*") and
      result = "Dubious type \"" + type + "\" in " + pred + " model."
      or
      not name.regexpMatch("[a-zA-Z0-9_<>,]*") and
      result = "Dubious member name \"" + name + "\" in " + pred + " model."
      or
      not signature.regexpMatch("|\\([a-zA-Z0-9_<>\\.\\+\\*,\\[\\]]*\\)") and
      result = "Dubious signature \"" + signature + "\" in " + pred + " model."
      or
      not ext.regexpMatch("|Attribute") and
      result = "Unrecognized extra API graph element \"" + ext + "\" in " + pred + " model."
    )
  }

  /** Holds if some row in a CSV-based flow model appears to contain typos. */
  query predicate invalidModelRow(string msg) {
    msg =
      [
        getInvalidModelSignature(), getInvalidModelInput(), getInvalidModelOutput(),
        getInvalidModelSubtype(), getInvalidModelColumnCount(), KindVal::getInvalidModelKind()
      ]
  }
}

private predicate elementSpec(
  string namespace, string type, boolean subtypes, string name, string signature, string ext
) {
  sourceModel(namespace, type, subtypes, name, signature, ext, _, _, _) or
  sinkModel(namespace, type, subtypes, name, signature, ext, _, _, _) or
  summaryModel(namespace, type, subtypes, name, signature, ext, _, _, _, _)
}

/** Gets the fully templated version of `f`. */
private Function getFullyTemplatedMemberFunction(Function f) {
  not f.isFromUninstantiatedTemplate(_) and
  exists(Class c, Class templateClass, int i |
    c.isConstructedFrom(templateClass) and
    f = c.getAMember(i) and
    result = templateClass.getCanonicalMember(i)
  )
}

/**
 * Gets the type name of the `n`'th parameter of `f` without any template
 * arguments.
 */
bindingset[f]
pragma[inline_late]
string getParameterTypeWithoutTemplateArguments(Function f, int n) {
  exists(string s, string base, string specifiers |
    s = f.getParameter(n).getType().getName() and
    parseAngles(s, base, _, specifiers) and
    result = base + specifiers
  )
}

/**
 * Normalize the `n`'th parameter of `f` by replacing template names
 * with `func:N` (where `N` is the index of the template).
 */
private string getTypeNameWithoutFunctionTemplates(Function f, int n, int remaining) {
  exists(Function templateFunction |
    templateFunction = getFullyTemplatedMemberFunction(f) and
    remaining = templateFunction.getNumberOfTemplateArguments() and
    result = getParameterTypeWithoutTemplateArguments(templateFunction, n)
  )
  or
  exists(string mid, TemplateParameter tp, Function templateFunction |
    mid = getTypeNameWithoutFunctionTemplates(f, n, remaining + 1) and
    templateFunction = getFullyTemplatedMemberFunction(f) and
    tp = templateFunction.getTemplateArgument(remaining) and
    result = mid.replaceAll(tp.getName(), "func:" + remaining.toString())
  )
}

/**
 * Normalize the `n`'th parameter of `f` by replacing template names
 * with `class:N` (where `N` is the index of the template).
 */
private string getTypeNameWithoutClassTemplates(Function f, int n, int remaining) {
  exists(Class template |
    f.getDeclaringType().isConstructedFrom(template) and
    remaining = template.getNumberOfTemplateArguments() and
    result = getTypeNameWithoutFunctionTemplates(f, n, 0)
  )
  or
  exists(string mid, TemplateParameter tp, Class template |
    mid = getTypeNameWithoutClassTemplates(f, n, remaining + 1) and
    f.getDeclaringType().isConstructedFrom(template) and
    tp = template.getTemplateArgument(remaining) and
    result = mid.replaceAll(tp.getName(), "class:" + remaining.toString())
  )
}

private string getParameterTypeName(Function c, int i) {
  result = getTypeNameWithoutClassTemplates(c, i, 0)
}

/** Splits `s` by `,` and gets the `i`'th element. */
bindingset[s]
pragma[inline_late]
private string getAtIndex(string s, int i) {
  result = s.splitAt(",", i) and
  // when `s` is `""` and `i` is `0` we get `result = ""` which we don't want.
  not (s = "" and i = 0)
}

/**
 * Normalizes `partiallyNormalizedSignature` by replacing the `remaining`
 * number of template arguments in `partiallyNormalizedSignature` with their
 * index in `typeArgs`.
 */
private string getSignatureWithoutClassTemplateNames(
  string partiallyNormalizedSignature, string typeArgs, string nameArgs, int remaining
) {
  elementSpecWithArguments0(_, _, _, partiallyNormalizedSignature, typeArgs, nameArgs) and
  remaining = count(partiallyNormalizedSignature.indexOf(",")) + 1 and
  result = partiallyNormalizedSignature
  or
  exists(string mid |
    mid =
      getSignatureWithoutClassTemplateNames(partiallyNormalizedSignature, typeArgs, nameArgs,
        remaining + 1)
  |
    exists(string typeArg |
      typeArg = getAtIndex(typeArgs, remaining) and
      result = mid.replaceAll(typeArg, "class:" + remaining.toString())
    )
    or
    // Make sure `remaining` is properly bound
    remaining = [0 .. count(partiallyNormalizedSignature.indexOf(",")) + 1] and
    not exists(getAtIndex(typeArgs, remaining)) and
    result = mid
  )
}

/**
 * Normalizes `partiallyNormalizedSignature` by replacing:
 * - _All_ the template arguments in `partiallyNormalizedSignature` that refer to
 * template parameters in `typeArgs` with their index in `typeArgs`, and
 * - The `remaining` number of template arguments in `partiallyNormalizedSignature`
 * with their index in `nameArgs`.
 */
private string getSignatureWithoutFunctionTemplateNames(
  string partiallyNormalizedSignature, string typeArgs, string nameArgs, int remaining
) {
  remaining = count(partiallyNormalizedSignature.indexOf(",")) + 1 and
  result =
    getSignatureWithoutClassTemplateNames(partiallyNormalizedSignature, typeArgs, nameArgs, 0)
  or
  exists(string mid |
    mid =
      getSignatureWithoutFunctionTemplateNames(partiallyNormalizedSignature, typeArgs, nameArgs,
        remaining + 1)
  |
    exists(string nameArg |
      nameArg = getAtIndex(nameArgs, remaining) and
      result = mid.replaceAll(nameArg, "func:" + remaining.toString())
    )
    or
    // Make sure `remaining` is properly bound
    remaining = [0 .. count(partiallyNormalizedSignature.indexOf(",")) + 1] and
    not exists(getAtIndex(nameArgs, remaining)) and
    result = mid
  )
}

private string paramsStringPart(Function c, int i) {
  not c.isFromUninstantiatedTemplate(_) and
  (
    i = -1 and result = "(" and exists(c)
    or
    exists(int n, string p | getParameterTypeName(c, n) = p |
      i = 2 * n and result = p
      or
      i = 2 * n - 1 and result = "," and n != 0
    )
    or
    i = 2 * c.getNumberOfParameters() and result = ")"
  )
}

/**
 * Gets a parenthesized string containing all parameter types of this callable, separated by a comma.
 *
 * Returns the empty string if the callable has no parameters.
 * Parameter types are represented by their type erasure.
 */
cached
private string paramsString(Function c) {
  result = concat(int i | | paramsStringPart(c, i) order by i)
}

bindingset[func]
private predicate matchesSignature(Function func, string signature) {
  signature = "" or
  paramsString(func) = signature
}

/**
 * Holds if `elementSpec(_, type, _, name, signature, _)` holds and
 * - `typeArgs` represents the named template parameters supplied to `type`, and
 * - `nameArgs` represents the named template parameters supplied to `name`, and
 * - `normalizedSignature` is `signature`, except with
 *    - template parameter names replaced by `func:i` if the template name is
 *      the `i`'th entry in `nameArgs`, and
 *    - template parameter names replaced by `class:i` if the template name is
 *      the `i`'th entry in `typeArgs`.
 *
 * In other words, the string `normalizedSignature` represents a "normalized"
 * signature with no mention of any free template parameters.
 *
 * For example, consider a summary row such as:
 * ```
 * elementSpec(_, "MyClass<B, C>", _, myFunc<A>, "(const A &,int,C,B *)", _)
 * ```
 * In this case, `normalizedSignature` will be `"(const func:0 &,int,class:1,class:0 *)"`.
 */
private predicate elementSpecWithArguments(
  string signature, string type, string name, string normalizedSignature, string typeArgs,
  string nameArgs
) {
  exists(string signatureWithoutParens |
    elementSpecWithArguments0(signature, type, name, signatureWithoutParens, typeArgs, nameArgs) and
    normalizedSignature =
      getSignatureWithoutFunctionTemplateNames(signatureWithoutParens, typeArgs, nameArgs, 0)
  )
}

/** Gets the `n`'th normalized signature parameter for the function `name` in class `type`. */
private string getSignatureParameterName(string signature, string type, string name, int n) {
  exists(string normalizedSignature |
    elementSpecWithArguments(signature, type, name, normalizedSignature, _, _) and
    result = getAtIndex(normalizedSignature, n)
  )
}

/**
 * Holds if the `i`'th name in `signature` matches the `i` name in `paramsString(func)`.
 *
 * When `paramsString(func)[i]` is `class:n` then the signature name is
 * compared with the `n`'th name in `type`, and when `paramsString(func)[i]`
 * is `func:n` then the signature name is compared with the `n`'th name
 * in `name`.
 */
private predicate signatureMatches(Function func, string signature, string type, string name, int i) {
  exists(string s |
    s = getSignatureParameterName(signature, type, name, i) and
    s = getParameterTypeName(func, i)
  ) and
  if exists(getParameterTypeName(func, i + 1))
  then signatureMatches(func, signature, type, name, i + 1)
  else i = count(signature.indexOf(","))
}

/**
 * Holds if `s` can be broken into a string of the form
 * `beforeAngles<betweenAngles>`,
 * or `s = beforeAngles` where `beforeAngles` does not have any brackets.
 */
bindingset[s]
pragma[inline_late]
private predicate parseAngles(
  string s, string beforeAngles, string betweenAngles, string afterAngles
) {
  beforeAngles = s.regexpCapture("([^<]+)(?:<([^>]+)>(.*))?", 1) and
  (
    betweenAngles = s.regexpCapture("([^<]+)(?:<([^>]+)>(.*))?", 2) and
    afterAngles = s.regexpCapture("([^<]+)(?:<([^>]+)>(.*))?", 3)
    or
    not exists(s.regexpCapture("([^<]+)(?:<([^>]+)>(.*))?", 2)) and
    betweenAngles = "" and
    afterAngles = ""
  )
}

/** Holds if `s` can be broken into a string of the form `(betweenParens)`. */
bindingset[s]
pragma[inline_late]
private predicate parseParens(string s, string betweenParens) {
  betweenParens = s.regexpCapture("\\(([^\\)]+)\\)", 1)
}

/**
 * Holds if `elementSpec(_, type, _, name, signature, _)` and:
 * - `type` introduces template parameters `typeArgs`, and
 * - `name` introduces template parameters `nameArgs`, and
 * - `signatureWithoutParens` equals `signature`, but with the surrounding
 *    parentheses removed.
 */
private predicate elementSpecWithArguments0(
  string signature, string type, string name, string signatureWithoutParens, string typeArgs,
  string nameArgs
) {
  elementSpec(_, type, _, name, signature, _) and
  parseAngles(name, _, nameArgs, "") and
  (
    type = "" and typeArgs = ""
    or
    parseAngles(type, _, typeArgs, "")
  ) and
  parseParens(signature, signatureWithoutParens)
}

/**
 * Holds if `elementSpec(namespace, type, subtypes, name, signature, _)` and
 * `method`'s signature matches `signature`.
 *
 * `signature` may contain template parameter names that are bound by `type` and `name`.
 */
pragma[nomagic]
private predicate elementSpecMatchesSignature(
  Function method, string namespace, string type, boolean subtypes, string name, string signature
) {
  elementSpec(namespace, pragma[only_bind_into](type), subtypes, pragma[only_bind_into](name),
    pragma[only_bind_into](signature), _) and
  signatureMatches(method, signature, type, name, 0)
}

/**
 * Holds if `classWithMethod` has `method` named `name` (excluding any
 * template parameters).
 */
bindingset[name]
pragma[inline_late]
private predicate hasClassAndName(Class classWithMethod, Function method, string name) {
  exists(string nameWithoutArgs |
    parseAngles(name, nameWithoutArgs, _, "") and
    classWithMethod = method.getClassAndName(nameWithoutArgs)
  )
}

/**
 * Holds if `nameClass` is in namespace `namespace` and has
 * name `type` (excluding any template parameters).
 */
bindingset[type, namespace]
pragma[inline_late]
private predicate hasQualifiedName(Class namedClass, string namespace, string type) {
  exists(string typeWithoutArgs |
    parseAngles(type, typeWithoutArgs, _, "") and
    namedClass.hasQualifiedName(namespace, typeWithoutArgs)
  )
}

/**
 * Gets the element in module `namespace` that satisfies the following properties:
 * 1. If the element is a member of a class-like type, then the class-like type has name `type`
 * 2. If `subtypes = true` and the element is a member of a class-like type, then overrides of the element
 *    are also returned.
 * 3. The element has name `name`
 * 4. If `signature` is non-empty, then the element has a list of parameter types described by `signature`.
 *
 * NOTE: `namespace` is currently not used (since we don't properly extract modules yet).
 */
pragma[nomagic]
private Element interpretElement0(
  string namespace, string type, boolean subtypes, string name, string signature
) {
  (
    elementSpec(namespace, type, subtypes, name, signature, _) and
    // Non-member functions
    exists(Function func |
      func.hasQualifiedName(namespace, name) and
      type = "" and
      matchesSignature(func, signature) and
      subtypes = false and
      not exists(func.getDeclaringType()) and
      result = func
    )
    or
    // Member functions
    exists(Class namedClass, Class classWithMethod |
      (
        elementSpecMatchesSignature(result, namespace, type, subtypes, name, signature) and
        hasClassAndName(classWithMethod, result, name)
        or
        signature = "" and
        elementSpec(namespace, type, subtypes, name, "", _) and
        hasClassAndName(classWithMethod, result, name)
      ) and
      hasQualifiedName(namedClass, namespace, type) and
      (
        // member declared in the named type or a subtype of it
        subtypes = true and
        classWithMethod = namedClass.getADerivedClass*()
        or
        // member declared directly in the named type
        subtypes = false and
        classWithMethod = namedClass
      )
    )
    or
    elementSpec(namespace, type, subtypes, name, signature, _) and
    // Member variables
    signature = "" and
    exists(Class namedClass, Class classWithMember, MemberVariable member |
      member.getName() = name and
      member = classWithMember.getAMember() and
      namedClass.hasQualifiedName(namespace, type) and
      result = member
    |
      // field declared in the named type or a subtype of it (or an extension of any)
      subtypes = true and
      classWithMember = namedClass.getADerivedClass*()
      or
      // field declared directly in the named type (or an extension of it)
      subtypes = false and
      classWithMember = namedClass
    )
    or
    // Global or namespace variables
    elementSpec(namespace, type, subtypes, name, signature, _) and
    signature = "" and
    type = "" and
    subtypes = false and
    result = any(GlobalOrNamespaceVariable v | v.hasQualifiedName(namespace, name))
  )
}

/** Gets the source/sink/summary element corresponding to the supplied parameters. */
Element interpretElement(
  string namespace, string type, boolean subtypes, string name, string signature, string ext
) {
  elementSpec(namespace, type, subtypes, name, signature, ext) and
  exists(Element e | e = interpretElement0(namespace, type, subtypes, name, signature) |
    ext = "" and result = e
  )
}

cached
private module Cached {
  /**
   * Holds if `node` is specified as a source with the given kind in a CSV flow
   * model.
   */
  cached
  predicate sourceNode(DataFlow::Node node, string kind) {
    exists(SourceSinkInterpretationInput::InterpretNode n |
      isSourceNode(n, kind, _) and n.asNode() = node // TODO
    )
  }

  /**
   * Holds if `node` is specified as a sink with the given kind in a CSV flow
   * model.
   */
  cached
  predicate sinkNode(DataFlow::Node node, string kind) {
    exists(SourceSinkInterpretationInput::InterpretNode n |
      isSinkNode(n, kind, _) and n.asNode() = node // TODO
    )
  }
}

import Cached

private predicate interpretSummary(
  Function f, string input, string output, string kind, string provenance
) {
  exists(
    string namespace, string type, boolean subtypes, string name, string signature, string ext
  |
    summaryModel(namespace, type, subtypes, name, signature, ext, input, output, kind, provenance) and
    f = interpretElement(namespace, type, subtypes, name, signature, ext)
  )
}

// adapter class for converting Mad summaries to `SummarizedCallable`s
private class SummarizedCallableAdapter extends SummarizedCallable {
  SummarizedCallableAdapter() { interpretSummary(this, _, _, _, _) }

  private predicate relevantSummaryElementManual(string input, string output, string kind) {
    exists(Provenance provenance |
      interpretSummary(this, input, output, kind, provenance) and
      provenance.isManual()
    )
  }

  private predicate relevantSummaryElementGenerated(string input, string output, string kind) {
    exists(Provenance provenance |
      interpretSummary(this, input, output, kind, provenance) and
      provenance.isGenerated()
    )
  }

  override predicate propagatesFlow(
    string input, string output, boolean preservesValue, string model
  ) {
    exists(string kind |
      this.relevantSummaryElementManual(input, output, kind)
      or
      not this.relevantSummaryElementManual(_, _, _) and
      this.relevantSummaryElementGenerated(input, output, kind)
    |
      if kind = "value" then preservesValue = true else preservesValue = false
    ) and
    model = "" // TODO
  }

  override predicate hasProvenance(Provenance provenance) {
    interpretSummary(this, _, _, _, provenance)
  }
}

// adapter class for converting Mad neutrals to `NeutralCallable`s
private class NeutralCallableAdapter extends NeutralCallable {
  string kind;
  string provenance_;

  NeutralCallableAdapter() {
    // Neutral models have not been implemented for CPP.
    none() and
    exists(this) and
    exists(kind) and
    exists(provenance_)
  }

  override string getKind() { result = kind }

  override predicate hasProvenance(Provenance provenance) { provenance = provenance_ }
}
