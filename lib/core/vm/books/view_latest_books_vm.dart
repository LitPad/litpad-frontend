import '../../core.dart';

class ViewLatestBooksVM extends BaseVM {
  Future<ApiResponse> viewLatestBooks() async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/books',
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
