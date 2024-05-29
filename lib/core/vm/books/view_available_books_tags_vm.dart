import '../../core.dart';

class ViewAvailableBooksTagVM extends BaseVM {
  Future<ApiResponse> viewAvailableBookTags() async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/books/tags',
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
