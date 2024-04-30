import '../../core.dart';

class GoogleLoginVM extends BaseVM {

  Future<ApiResponse> googleLogin() async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/auth/google',
      data: {},
      onSuccess: (data) {
        // Store the access token
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
