import '../../core.dart';

class DeleteChapterVM extends BaseVM {
  // List<BookGenre> bookGenre = [];
  Future<ApiResponse> deleteChapter() async {
    return makeRequest(
      method: DioHttpMethod.DELETE,
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
