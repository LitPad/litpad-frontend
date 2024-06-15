import '../../core.dart';

class ViewSingleBooksPartialChapterVM extends BaseVM {
  // List<BookGenre> bookGenre = [];
  Future<ApiResponse> viewSingleBookPartialChapter() async {
    return makeRequest(
      method: DioHttpMethod.GET,
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