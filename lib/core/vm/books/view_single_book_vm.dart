import '../../core.dart';

class ViewSingleBooksVM extends BaseVM {
  // List<BookGenre> bookGenre = [];
  Future<ApiResponse> viewSingleBooks() async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/books/book-full/{slug}',
      data: {},
      onSuccess: (data) {
        // bookGenre = (data['data'] as List)
        //     .map((genre) => BookGenre.fromJson(genre))
        //     .toList();

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
