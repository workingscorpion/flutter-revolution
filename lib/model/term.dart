class Term {
  final bool require;
  final String title;
  bool checked;
  final bool showDetail;
  final String detail;

  Term({
    this.require,
    this.title,
    this.checked,
    this.showDetail = true,
    this.detail,
  });
}
