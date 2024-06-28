import '../../core.dart';

class SetNewPasswordVM extends BaseVM {
  TextEditingController newPasswordC = TextEditingController();
  TextEditingController confirmPasswordC = TextEditingController();
  bool isSuccess = false;


  Future<ApiResponse> setNewPass(String? token) async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/auth/set-new-password',
      data: {
        "password": newPasswordC.text.trim(),
        "token_string": token,
      },
      onSuccess: (data) {
        bool isSuccess = true;
        notifyListeners();
        return ApiResponse(success: true, data: data);
      },
    );
  }

  @override
  void dispose() {
    printty("SignUpVM disposed");
    newPasswordC.dispose();
    super.dispose();
  }
}
