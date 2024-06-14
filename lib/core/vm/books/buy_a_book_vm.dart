import '../../core.dart';

class BuyBooksVM extends BaseVM {
  // List<BookGenre> bookGenre = [];
  Future<ApiResponse> buyABook() async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/books/book/{slug}/buy',
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