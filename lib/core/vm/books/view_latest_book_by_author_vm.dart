import '../../core.dart';

class ViewLatestBookByAuthorVM extends BaseVM {
  Future<ApiResponse> viewBookByAuthor() async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/books/author/{username}',
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
