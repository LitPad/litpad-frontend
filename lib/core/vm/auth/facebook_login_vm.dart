import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../app/local_storage.dart';
import '../../../app/session_storage.dart';
import '../../core.dart';

class FaceBookLoginVM extends BaseVM {
  Future<String?> facebookLogin() async {
    try {

      final LoginResult result = await FacebookAuth.instance.login();
      if (result.status == LoginStatus.success) {
        final accessToken = result.accessToken?.token;
        printty(accessToken, logLevel: 'Facebook token');

        final response = await makeRequest(
          method: DioHttpMethod.POST,
          endpoint: '/auth/facebook',
          data: {'token': accessToken},
          onSuccess: (data) {
            // Store the access token obtained from your backend

            SessionStorageHelper.saveValue("accessToken", data['access']);
            LocalStorageHelper.saveValue('refreshToken', data['refresh']);
            return ApiResponse(success: true, data: data);
          },
        );

        return response.data;
      } else {
        debugPrint('Login failed due to status: ${result.message}');
        return null;
      }
    } on PlatformException catch (e) {
      debugPrint('PlatformException: ${e.message}');
      return null; // Or handle exceptions more gracefully
    }
  }

  @override
  void dispose() {
    printty("SignUpVM disposed");
    super.dispose();
  }
}
