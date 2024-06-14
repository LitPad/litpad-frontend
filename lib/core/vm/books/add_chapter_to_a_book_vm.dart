import '../../core.dart';

class AddChapterToBookVM extends BaseVM {
  // List<BookGenre> bookGenre = [];
  Future<ApiResponse> addChapterToBook() async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/books/book/{slug}/add-chapter',
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