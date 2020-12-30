class WritingMistake {
  final int offset;
  final int length;
  final String issueType, issueDescription;
  final List<String> replacements;

  WritingMistake({
    this.offset,
    this.length,
    this.issueType,
    this.issueDescription,
    this.replacements,
  });
}
