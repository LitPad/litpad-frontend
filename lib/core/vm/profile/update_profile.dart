import '../../core.dart';

class UpdateProfileVM extends BaseVM {
  TextEditingController usernameC = TextEditingController();
  Future<ApiResponse> updateProfile() async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: 'profiles/update',
      data: {
        'username' : usernameC.text.trim()
      },
      onSuccess: (data) {
        return ApiResponse(success: true, data: data);
      },
    );
  }

  @override
  void dispose() {
    printty("Update profile disposed");
    usernameC.dispose();
    super.dispose();
  }
}
