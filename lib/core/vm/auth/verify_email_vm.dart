import '../../core.dart';

class VerifyMailVM extends BaseVM {
  bool isSuccess = false;

  Future<ApiResponse> verifyMail({required String token}) async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/auth/verify-email',
      data: {
        "token_string": token,
      },
      onSuccess: (data) {
        isSuccess = true;
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
