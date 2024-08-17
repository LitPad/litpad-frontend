import '../../core.dart';

class UpdatePasswordVM extends BaseVM {
  TextEditingController oldPasswordC = TextEditingController();
  TextEditingController newPasswordC = TextEditingController();

  Future<ApiResponse> updatePassword() async {
    return makeRequest(
      method: DioHttpMethod.PUT,
      endpoint: '/profiles/update-password',
      data: {
        "new_password": newPasswordC.text.trim(),
        "old_password": oldPasswordC.text.trim(),
      },
      onSuccess: (data) {
        return ApiResponse(success: true, data: data);
      },
    );
  }


  @override
  void dispose() {
    printty("SignUpVM disposed");
    newPasswordC.dispose();
    oldPasswordC.dispose();
    super.dispose();
  }
}
