import 'package:litpad/app/local_storage.dart';
import 'package:litpad/app/session_storage.dart';
import 'package:litpad/core/core.dart';
import 'package:provider/provider.dart';

import '../profile/view_user_profile.dart';

//Todo: Handle proper user data saving and confirm the getProfile implementation
class LoginVM extends BaseVM {
  User? user;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  LoginVM() {
    loadUserDetails();
  }
  saveAccessToken(key, value) async {
    SessionStorageHelper.saveValue(key, value);
    LocalStorageHelper.saveValue(key, value);
  }

  saveRefreshTokenToken(key, value) async {
    SessionStorageHelper.saveValue(key, value);
    LocalStorageHelper.saveValue(key, value);
  }

  Future<ApiResponse> login() async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/auth/login',
      data: {
        "email": emailC.text.trim(),
        "password": passwordC.text.trim(),
      },
      onSuccess: (data) {
        String accessToken = data['data']['access'];
        String refreshToken = data['data']['refresh'];

        saveAccessToken('accessToken', accessToken);
        saveRefreshTokenToken('refreshToken', refreshToken);


        debugPrint('access token ==> :${data['data']['access']}');
        debugPrint('refresh token ==> :${data['data']['refresh']}');
        user = User.fromMap(data['data']);
        LocalStorageHelper.saveUser(user!);


        notifyListeners();
        return ApiResponse(success: true, data: data);
      },
    );
  }

  void loadUserDetails() {
    user = LocalStorageHelper.getUser();
    if (user != null) {
      notifyListeners();
    }
  }
  @override
  void dispose() {
    printty("SignUpVM disposed");

    passwordC.dispose();
    emailC.dispose();

    super.dispose();
  }
}
