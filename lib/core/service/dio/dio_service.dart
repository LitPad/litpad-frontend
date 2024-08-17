import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:litpad/core/core.dart';

// class DioService {
//   final Dio _dio = Dio();
//
//   DioService() {
//     _dio.options.baseUrl = dotenv.env['STAGING_URL'] ?? "";
//     // _dio.options.connectTimeout = const Duration(milliseconds: 20000); // 5s
//     // _dio.options.receiveTimeout = const Duration(milliseconds: 3000); // 3s
//
//     // _dio.interceptors.add(TokenInterceptor());
//   }
//
//   Future<Response> request(String method, String path,
//       {Map<String, dynamic>? queryParameters,
//       dynamic data,
//       bool isMultipart = false,
//       String? accessToken}) async {
//     printty(_dio.options.baseUrl, logLevel: 'BASE_URL');
//     printty(path, logLevel: 'PATH');
//     try {
//       if (accessToken != null) {
//         _dio.options.headers['Authorization'] = 'Bearer $accessToken';
//       }
//       if (isMultipart) {
//         _dio.options.headers['Content-Type'] = 'multipart/form-data';
//       }
//       switch (method) {
//         case DioHttpMethod.GET:
//           return await _dio.get(path, queryParameters: queryParameters);
//         case DioHttpMethod.POST:
//           return await _dio.post(path, data: data);
//         case DioHttpMethod.PUT:
//           return await _dio.put(path, data: data);
//         case DioHttpMethod.DELETE:
//           return await _dio.delete(path, queryParameters: queryParameters);
//         default:
//           throw Exception('Invalid HTTP method');
//       }
//     }  catch (e, s) {
//       printty('YYY $e');
//       printty('Stack trace $s');
//       if (e is SocketException) {
//         throw Exception('No internet connection');
//       }
//       inspect(e);
//       // _handleDioError(e);
//       debugPrint('444 === $e');
//
//       rethrow;
//     }
//     // catch (e) {
//     //   printty('Ewww $e');
//     // }
//     // return data;
//   }
//
//   void _handleDioError(DioException e) {
//     if (e.type == DioExceptionType.connectionTimeout) {
//       printty("Timeout error occurred");
//     } else if (e.type == DioExceptionType.sendTimeout) {
//       printty("Send timeout error occurred");
//     } else if (e.type == DioExceptionType.receiveTimeout) {
//       printty("Receive timeout error occurred");
//     } else if (e.type == DioExceptionType.badResponse) {
//       printty(
//           "Response error occurred ${e.response?.statusCode} ${e..message}");
//     } else if (e.type == DioExceptionType.cancel) {
//       printty("Request cancelled");
//     } else {
//       printty("An error occurred: ${e.message}");
//     }
//
//   }
// }

class DioService {
  final Dio _dio = Dio();

  DioService() {
    _dio.options.baseUrl = dotenv.env['STAGING_URL'] ?? "";
    // _dio.options.connectTimeout = const Duration(milliseconds: 20000); // 5s
    // _dio.options.receiveTimeout = const Duration(milliseconds: 3000); // 3s

    _dio.interceptors.add(TokenInterceptor());
  }

  Future<Response> request(String method, String path,
      {Map<String, dynamic>? queryParameters,
      dynamic data,
      bool isMultipart = false,
      String? accessToken}) async {
    printty(_dio.options.baseUrl, logLevel: 'BASE_URL');
    printty(path, logLevel: 'PATH');
    try {
      if (accessToken != null) {
        _dio.options.headers['Authorization'] = 'Bearer $accessToken';
      }
      if (isMultipart == true) {
        _dio.options.headers['Content-Type'] = 'multipart/form-data';
      }
      Response response;
      switch (method) {
        case DioHttpMethod.GET:
          response = await _dio.get(path, queryParameters: queryParameters);
          break;
        case DioHttpMethod.POST:
          response = await _dio.post(path, data: data);
          break;
        case DioHttpMethod.PUT:
          response = await _dio.put(path, data: data);
          break;
        case DioHttpMethod.DELETE:
          response = await _dio.delete(path, queryParameters: queryParameters);
          break;
        default:
          throw Exception('Invalid HTTP method');
      }
      return response;
    } catch (e) {
      if (e is DioException) {
        return e.response!;
      } else {
        rethrow;
      }
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
      printty("Response error occurred ${e.response?.statusCode} ${e.message}");
    } else if (e.type == DioExceptionType.cancel) {
      printty("Request cancelled");
    } else {
      printty("An error occurred: ${e.message}");
    }
  }
}
