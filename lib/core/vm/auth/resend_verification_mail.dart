import '../../core.dart';

class ResendVerificationMailVM extends BaseVM {
  TextEditingController emailC = TextEditingController();

  Future<ApiResponse> verifyMail() async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/auth/resend-verification-email',
      data: {
        "email": emailC.text.trim(),
      },
      onSuccess: (data) {
        return ApiResponse(success: true, data: data);
      },
    );
  }

  @override
  void dispose() {
    printty("SignUpVM disposed");
    emailC.dispose();
    super.dispose();
  }
}
