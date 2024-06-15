import '../../core.dart';

class DeleteBookVM extends BaseVM {
  // List<BookGenre> bookGenre = [];
  Future<ApiResponse> deleteBook() async {
    return makeRequest(
      method: DioHttpMethod.DELETE,
      endpoint: '/books/book/{slug}',
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