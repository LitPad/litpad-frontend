import 'package:litpad/app/session_storage.dart';
import 'package:litpad/core/core.dart';

import '../../../app/local_storage.dart';

class LoginVM extends BaseVM {
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  Future<ApiResponse> login() async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/auth/login',
      data: {
        "email": emailC.text.trim(),
        "password": passwordC.text.trim(),
      },
      onSuccess: (data) {
        SessionStorageHelper.saveValue("accessToken", data['access']);
        LocalStorageHelper.saveValue('refreshToken', data['refresh']);

        debugPrint('data :${data['access']}');

        return ApiResponse(success: true, data: data);
      },
    );
  }
}
