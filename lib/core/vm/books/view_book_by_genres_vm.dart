import '../../core.dart';

class ViewBooksByGenreVM extends BaseVM {
  Future<ApiResponse> viewBooksByGenre() async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/books/genres',
      data: {},
      onSuccess: (data) {
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
