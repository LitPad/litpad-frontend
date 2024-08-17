class PartialViewChapter {
  final String chapterStatus;
  final String text;
  final String title;
  final String slug;
  final int wordCount;

  PartialViewChapter({
    required this.chapterStatus,
    required this.text,
    required this.title,
    required this.slug,
    required this.wordCount,
  });

  factory PartialViewChapter.fromJson(Map<String, dynamic> json) {
    return PartialViewChapter(
      chapterStatus: json['chapter_status'] ?? '',
      text: json['text'] ?? '',
      title: json['title'] ?? '',
      slug: json['slug'],
      wordCount: json['word_count'] ?? 0,
    );
  }
}
