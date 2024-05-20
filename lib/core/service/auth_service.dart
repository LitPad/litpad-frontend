// import 'package:litpad/core/service/api_service.dart';
// import 'package:stacked/stacked.dart';

// import '../../app/locator.dart';
// import '../models/user.dart';

// class AuthService extends BaseViewModel {
//   final _apiCall = locator<ApiService>();
//   User? _currentUser;
//   bool _isLoggedIn = false;
//   bool get isLoggedIn => _isLoggedIn;

//   Future signUp() {
//     final signUpResponse =
//         _apiCall.call(method: HttpMethod.post, path: '', body: {});
//     return signUpResponse;
//   }

//   Future signIn() {
//     //Todo: Change response types to Map dynamic type
//     final signInResponse =
//         _apiCall.call(method: HttpMethod.post, path: '', body: {});
//     _isLoggedIn = true;
//     notifyListeners();
//     return signInResponse;
//   }

//   Future signInWithGoogle() {
//     final signInWithGoogleResponse =
//         _apiCall.call(method: HttpMethod.post, path: '', body: {});
//     return signInWithGoogleResponse;
//   }

//   Future signInWithFacebook() {
//     final signInWithFacebookResponse =
//         _apiCall.call(method: HttpMethod.post, path: '', body: {});
//     return signInWithFacebookResponse;
//   }
// }

import '../../app/local_storage.dart';
import '../../app/session_storage.dart';
import '../core.dart';

class AuthService extends BaseVM {

  Future<String?> getAccessToken() async {
    return SessionStorageHelper.getValue('accessToken');
  }

  Future<String?> getRefreshToken() async {
    return LocalStorageHelper.getValue('refreshToken');
  }

  Future<void> saveTokens(String accessToken, String refreshToken) async {
    SessionStorageHelper.saveValue('accessToken', accessToken);
    LocalStorageHelper.saveValue('refreshToken', refreshToken);
  }

  Future<void> clearTokens() async {
    SessionStorageHelper.removeValue('accessToken');
    LocalStorageHelper.removeValue('refreshToken');
  }

  Future<ApiResponse> refreshAccessToken() async {
    final refreshToken = await getRefreshToken();
    if (refreshToken == null) {
      return ApiResponse(success: false, message: 'No refresh token available');
    }
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/auth/refresh',
      data: {'refresh': refreshToken},
      onSuccess: (data) {
        final newAccessToken = data['access'];
        debugPrint('New access ==> $newAccessToken');
        debugPrint('data :${data['data']['access']}');
        SessionStorageHelper.saveValue('accessToken', newAccessToken);
        return ApiResponse(success: true, data: newAccessToken);
      },
    );
    // return await _dioService.request(
    //   'POST',
    //   '/auth/refresh',
    //   data: {'refresh': refreshToken},
    //   onSuccess: (data) async {
    //     final newAccessToken = data['access'];
    //     SessionStorageHelper.saveValue('accessToken', newAccessToken);
    //     return ApiResponse(success: true, data: newAccessToken);
    //   },
    // );
  }

  Future<bool> isAuthenticated() async {
    final accessToken = await getAccessToken();
    if (accessToken != null) {
      return true; // Optionally, verify token validity here
    }
    final response = await refreshAccessToken();
    return response.success;
  }
}
