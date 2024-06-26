import '../../core.dart';

class ResetPasswordVM extends BaseVM {
  TextEditingController emailC = TextEditingController();

  Future<ApiResponse> resetPassword() async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/auth/send-password-reset-otp',
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
