import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:litpad/core/core.dart';

class DioService {
  final Dio _dio = Dio();

  DioService() {
    _dio.options.baseUrl = dotenv.env['STAGING_URL'] ?? "";
    _dio.options.connectTimeout = const Duration(milliseconds: 20000); // 5s
    _dio.options.receiveTimeout = const Duration(milliseconds: 3000); // 3s

    // Add an interceptor for handling tokens
    _dio.interceptors.add(TokenInterceptor());
  }

  Future<Response> request(String method, String path,
      {Map<String, dynamic>? queryParameters,
      dynamic data,
      String? accessToken}) async {
    printty(_dio.options.baseUrl, logLevel: 'BASE_URL');
    printty(path, logLevel: 'PATH');
    try {
      if (accessToken != null) {
        _dio.options.headers['Authorization'] = 'Bearer $accessToken';
      }
      switch (method) {
        case DioHttpMethod.GET:
          return await _dio.get(path, queryParameters: queryParameters);
        case DioHttpMethod.POST:
          return await _dio.post(path, data: data);
        case DioHttpMethod.PUT:
          return await _dio.put(path, data: data);
        case DioHttpMethod.DELETE:
          return await _dio.delete(path, queryParameters: queryParameters);
        default:
          throw Exception('Invalid HTTP method');
      }
    } on DioException catch (e) {
      if (e.error is SocketException) {
        throw Exception('No internet connection');
      }
      if (e.response?.statusCode == 409) {
        throw Exception('Username already exists');
      }
      _handleDioError(e);
      rethrow;
    }
  }

  void _handleDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      printty("Timeout error occurred");
    } else if (e.type == DioExceptionType.sendTimeout) {
      printty("Send timeout error occurred");
    } else if (e.type == DioExceptionType.receiveTimeout) {
      printty("Receive timeout error occurred");
    } else if (e.type == DioExceptionType.badResponse) {
      printty(
          "Response error occurred ${e.response?.statusCode} ${e..message}");
    } else if (e.type == DioExceptionType.cancel) {
      printty("Request cancelled");
    } else {
      printty("An error occurred: ${e.message}");
    }
  }
}
