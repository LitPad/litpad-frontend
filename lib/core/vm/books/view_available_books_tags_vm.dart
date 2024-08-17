import 'package:litpad/core/models/books/books.dart';

import '../../core.dart';

class ViewAvailableBooksTagVM extends BaseVM {
  List<BookGenre> genres = [];

  Future<ApiResponse> viewAvailableBookGenres() async {
    final response = await makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/books/genres',
      data: {},
      onSuccess: (data) {
        genres = (data as List).map((genreJson) => BookGenre.fromJson(genreJson)).toList();
        for (var genre in genres) {
          debugPrint('Fetched genre: ${genre.name}');
          for (var tag in genre.tags) {
            debugPrint('Tag: ${tag.name}');
          }
        }
        notifyListeners();
        return ApiResponse(success: true, data: data);
      },
    );
    return response;
  }

  @override
  void dispose() {
    printty("ViewAvailableBooksTagVM disposed");
    super.dispose();
  }
}
