class BookGenre {
  final String name;
  final String slug;
  final List<Tag> tags;

  BookGenre({required this.name, required this.slug, required this.tags});

  factory BookGenre.fromJson(Map<String, dynamic> json) {
    return BookGenre(
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      tags: (json['tags'] as List).map((tag) => Tag.fromJson(tag)).toList(),
    );
  }
}

class Tag {
  final String name;
  final String slug;

  Tag({required this.name, required this.slug});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
    );
  }
}
