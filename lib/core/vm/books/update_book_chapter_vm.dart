import '../../core.dart';

class UpdateBookChapterVM extends BaseVM {
  Future<ApiResponse> updateBookChapter() async {
    return makeRequest(
      method: DioHttpMethod.PUT,
      endpoint: '/books/book/chapter/{slug}',
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