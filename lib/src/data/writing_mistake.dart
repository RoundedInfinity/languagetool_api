/// Object that stores information about a single writing mistake.
class WritingMistake {
  /// Position of the beginning of the mistake.
  final int offset;

  /// Length of the mistake after the offset.
  final int length;

  /// The type of mistake.
  final String issueType;

  /// Description of the [issueType].
  final String issueDescription;

  /// A brief description of the mistake.
  final String message;

  /// A list of suggestions for replacing the mistake.
  ///
  /// Sortet by probability.
  final List<String> replacements;

  /// Object that stores information about a single writing mistake.
  WritingMistake({
    this.message,
    this.offset,
    this.length,
    this.issueType,
    this.issueDescription,
    this.replacements,
  });

  /// Copies the object with the specified values changed.
  WritingMistake copyWith({
    int offset,
    int length,
    String issueType,
    String issueDescription,
    String message,
    List<String> replacements,
  }) {
    return WritingMistake(
      offset: offset ?? this.offset,
      length: length ?? this.length,
      issueType: issueType ?? this.issueType,
      issueDescription: issueDescription ?? this.issueDescription,
      message: message ?? this.message,
      replacements: replacements ?? this.replacements,
    );
  }

  @override
  String toString() {
    // ignore: lines_longer_than_80_chars
    return 'WritingMistake(offset: $offset, length: $length, issueType: $issueType, issueDescription: $issueDescription, message: $message, replacements: $replacements)';
  }
}
