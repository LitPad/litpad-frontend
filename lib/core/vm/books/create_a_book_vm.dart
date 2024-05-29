import '../../core.dart';

class CreateABookVM extends BaseVM {
  Future<ApiResponse> createABook() async {
    return makeRequest(
      method: DioHttpMethod.POST,
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
