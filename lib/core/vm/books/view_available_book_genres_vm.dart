import 'package:litpad/core/models/books/book_genre_model.dart';

import '../../core.dart';

class ViewAvailableBooksGenreVM extends BaseVM {
  List<BookGenre> bookGenre = [];
  Future<ApiResponse> viewAvailableBooksGenre() async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/books/genres',
      data: {},
      onSuccess: (data) {
        bookGenre = (data['data'] as List)
            .map((genre) => BookGenre.fromJson(genre))
            .toList();

        notifyListeners();
        return ApiResponse(success: true, data: data);
      },
    );
  }

  @override
  void dispose() {
    printty("SignUpVM disposed");
    super.dispose();
  }
}
