import 'books_model.dart';

class Book {
  final Author author;
  final String blurb;
  final int chaptersCount;
  final String coverImage;
  final BookGenre genre;
  final PartialViewChapter partialViewChapter;
  final int price;
  final String slug;
  final List<Tag> tags;
  final String title;
  final int wordCount;

  Book({
    required this.author,
    required this.blurb,
    required this.chaptersCount,
    required this.coverImage,
    required this.genre,
    required this.partialViewChapter,
    required this.price,
    required this.slug,
    required this.tags,
    required this.title,
    required this.wordCount,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      author: Author.fromJson(json['author']),
      blurb: json['blurb'] ?? '',
      chaptersCount: json['chapters_count'] ?? 0,
      coverImage: json['cover_image'] ?? '',
      genre: BookGenre.fromJson(json['genre']),
      partialViewChapter:
          PartialViewChapter.fromJson(json['partial_view_chapter']),
      price: json['price'] ?? 0,
      slug: json['slug'] ?? '',
      tags: (json['tags'] as List).map((tag) => Tag.fromJson(tag)).toList(),
      title: json['title'] ?? '',
      wordCount: json['word_count'] ?? 0,
    );
  }
}

class BooksResponse {
  final List<Book> books;
  final int currentPage;
  final int lastPage;
  final int perPage;

  BooksResponse({
    required this.books,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
  });

  factory BooksResponse.fromJson(Map<String, dynamic> json) {
    return BooksResponse(
      books: (json['data']['books'] as List)
          .map((book) => Book.fromJson(book))
          .toList(),
      currentPage: json['data']['current_page'] ?? 1,
      lastPage: json['data']['last_page'] ?? 1,
      perPage: json['data']['per_page'] ?? 1,
    );
  }
}
