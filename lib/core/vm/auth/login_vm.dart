import 'package:litpad/core/core.dart';

class LoginVM extends BaseVM {
  TextEditingController userNameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  Future<ApiResponse> login() async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/login',
      data: {
        "username": userNameC.text.trim(),
        "password": passwordC.text.trim(),
      },
      onSuccess: (data) {
        // Store the access token
        return ApiResponse(success: true, data: data);
      },
    );
  }
}
