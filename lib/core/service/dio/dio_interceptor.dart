import 'package:dio/dio.dart';
import 'package:litpad/app/local_storage.dart';
import 'package:litpad/app/session_storage.dart';

class TokenInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await TokenManager.getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }
    return handler.next(options);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final newToken = await TokenManager.refreshAccessToken();
      if (newToken != null) {
        err.requestOptions.headers['Authorization'] = 'Bearer $newToken';
        try {
          final response = await Dio().fetch(err.requestOptions);
          return handler.resolve(response);
        } catch (error) {
          return handler.reject(DioException(
            requestOptions: err.requestOptions,
            error: error.toString(),
            type: DioExceptionType.badResponse,
          ));
        }
      } else {
        return handler.reject(DioException(
          requestOptions: err.requestOptions,
          error: 'Failed to refresh access token',
          type: DioExceptionType.badResponse,
        ));
      }
    }
    return handler.next(err);
  }
}

class TokenManager {
  static Future<String?> getAccessToken() async {
    return SessionStorageHelper.getValue('accessToken');
  }

  static Future<String?> getRefreshToken() async {
    return LocalStorageHelper.getValue('refreshToken');
  }
  static Future<void> saveTokens(String accessToken, String refreshToken) async {
    SessionStorageHelper.saveValue('accessToken', accessToken);
    LocalStorageHelper.saveValue('refreshToken', refreshToken);
  }

  static Future<void> clearTokens() async {
    SessionStorageHelper.removeValue('accessToken');
    LocalStorageHelper.removeValue('refreshToken');
  }

  static Future<String?> refreshAccessToken() async {
    final refreshToken = await getRefreshToken();
    if (refreshToken == null) {
      return null;
    }
    final response = await Dio().post('/auth/refresh', data: {'refresh': refreshToken});
    if (response.statusCode == 200|| response.statusCode == 201) {
      final newAccessToken = response.data['access'];
      SessionStorageHelper.saveValue('accessToken', newAccessToken);
      return newAccessToken;
    }
    return null;
  }
}
