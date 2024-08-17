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
