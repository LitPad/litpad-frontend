import 'package:litpad/core/core.dart';

class SignupVM extends BaseVM {
  TextEditingController userNameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController firstNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController emailC = TextEditingController();

  Future<ApiResponse> signUp() async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/register',
      data: {
        "username": userNameC.text.trim(),
        "password": passwordC.text.trim(),
        "email": emailC.text.trim(),
        "first_name": firstNameC.text.trim(),
        "last_name": lastNameC.text.trim(),
      },
      onSuccess: (data) {
        // Store the access token
        return ApiResponse(success: true, data: data);
      },
    );
  }

  @override
  void dispose() {
    printty("SignUpVM disposed");

    userNameC.dispose();
    passwordC.dispose();
    firstNameC.dispose();
    lastNameC.dispose();
    emailC.dispose();

    super.dispose();
  }
}
