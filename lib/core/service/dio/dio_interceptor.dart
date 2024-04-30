import 'package:dio/dio.dart';
import 'package:litpad/app/session_storage.dart';

class TokenInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = await TokenManager.getAccessToken();
    options.headers['Authorization'] = 'Bearer $accessToken';
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

  static Future<String?> refreshAccessToken() async {
    return SessionStorageHelper.getValue('refreshToken');
  }
}
