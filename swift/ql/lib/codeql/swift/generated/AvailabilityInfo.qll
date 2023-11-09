// generated by codegen/codegen.py
/**
 * This module provides the generated definition of `AvailabilityInfo`.
 * INTERNAL: Do not import directly.
 */

private import codeql.swift.generated.Synth
private import codeql.swift.generated.Raw
import codeql.swift.elements.AstNode
import codeql.swift.elements.AvailabilitySpec

module Generated {
  /**
   * An availability condition of an `if`, `while`, or `guard` statements.
   *
   * Examples:
   * ```
   * if #available(iOS 12, *) {
   *   // Runs on iOS 12 and above
   * } else {
   *   // Runs only anything below iOS 12
   * }
   * if #unavailable(macOS 10.14, *) {
   *   // Runs only on macOS 10 and below
   * }
   * ```
   * INTERNAL: Do not reference the `Generated::AvailabilityInfo` class directly.
   * Use the subclass `AvailabilityInfo`, where the following predicates are available.
   */
  class AvailabilityInfo extends Synth::TAvailabilityInfo, AstNode {
    override string getAPrimaryQlClass() { result = "AvailabilityInfo" }

    /**
     * Holds if it is #unavailable as opposed to #available.
     */
    predicate isUnavailable() {
      Synth::convertAvailabilityInfoToRaw(this).(Raw::AvailabilityInfo).isUnavailable()
    }

    /**
     * Gets the `index`th spec of this availability info (0-based).
     */
    AvailabilitySpec getSpec(int index) {
      result =
        Synth::convertAvailabilitySpecFromRaw(Synth::convertAvailabilityInfoToRaw(this)
              .(Raw::AvailabilityInfo)
              .getSpec(index))
    }

    /**
     * Gets any of the specs of this availability info.
     */
    final AvailabilitySpec getASpec() { result = this.getSpec(_) }

    /**
     * Gets the number of specs of this availability info.
     */
    final int getNumberOfSpecs() { result = count(int i | exists(this.getSpec(i))) }
  }
}
