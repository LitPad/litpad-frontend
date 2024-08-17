import 'books.dart';


class Genre {
  final String name;
  final String slug;

  Genre({
    required this.name,
    required this.slug,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      name: json['name'],
      slug: json['slug'],
    );
  }
}


class Book {
  final Author author;
  final String title;
  final String slug;
  final String blurb;
  final int ageDiscretion;
  final Genre genre;
  final List<dynamic>? tags;
  final int chaptersCount;
  final PartialViewChapter? partialViewChapter;
  final int wordCount;
  final String coverImage;
  final int? fullPrice;
  final int chapterPrice;
  final int views;
  final int votes;
  final DateTime createdAt;
  final DateTime updatedAt;

  Book({
    required this.author,
    required this.title,
    required this.slug,
    required this.blurb,
    required this.ageDiscretion,
    required this.genre,
    this.tags,
    required this.chaptersCount,
    this.partialViewChapter,
    required this.wordCount,
    required this.coverImage,
    this.fullPrice,
    required this.chapterPrice,
    required this.views,
    required this.votes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      author: Author.fromJson(json['author']),
      title: json['title'] ?? '',
      slug: json['slug'] ?? '',
      blurb: json['blurb'] ?? '',
      ageDiscretion: json['age_discretion'] ?? 0,
      genre: Genre.fromJson(json['genre']),
      tags: json['tags'] != null ? List<dynamic>.from(json['tags']) : null,
      chaptersCount: json['chapters_count'] ?? 0,
      partialViewChapter: json['partial_view_chapter'] != null
          ? PartialViewChapter.fromJson(json['partial_view_chapter'])
          : null,
      wordCount: json['word_count'] ?? 0,
      coverImage: json['cover_image'] ?? '',
      fullPrice: json['full_price'],
      chapterPrice: json['chapter_price'] ?? 0,
      views: json['views'] ?? 0,
      votes: json['votes'] ?? 0, // Ensure votes is handled
      createdAt: json['created_at'] != null ? DateTime.parse(json['created_at']) : DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.parse(json['updated_at']) : DateTime.now(),
    );
  }
}

class BooksResponse {
  final int perPage;
  final int currentPage;
  final int lastPage;
  final List<Book> books;

  BooksResponse({
    required this.perPage,
    required this.currentPage,
    required this.lastPage,
    required this.books,
  });

  factory BooksResponse.fromJson(Map<String, dynamic> json) {
    var booksList = json['books'] as List;
    List<Book> books = booksList.map((book) => Book.fromJson(book)).toList();

    return BooksResponse(
      perPage: json['per_page'] ?? 0,
      currentPage: json['current_page'] ?? 0,
      lastPage: json['last_page'] ?? 0,
      books: books,
    );
  }
}

