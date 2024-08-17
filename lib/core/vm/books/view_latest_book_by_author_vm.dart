// import 'dart:convert';
//
// import 'package:flutter_dotenv/flutter_dotenv.dart';
//
// import '../../../app/local_storage.dart';
// import '../../core.dart';
// import 'package:http/http.dart' as http;
//
// import '../../models/books/books.dart';
//
// class ViewLatestBookByAuthorVM extends BaseVM {
//   BooksResponse? booksResponse;
//   bool isLoading = false;
//
//   Future<ApiResponse> viewBookByAuthor() async {
//     String? accessToken = await TokenManager.getAccessToken();
//     String baseUrl = await dotenv.env['STAGING_URL'] ?? "";
//
//     User? user = LocalStorageHelper.getUser();
//     if (user == null) {
//       return ApiResponse(success: false, message: 'User not logged in');
//     }
//
//     String username = user.username;
//     debugPrint('Username--------- $username');
//
//     try {
//       Uri endpoint = Uri.parse(baseUrl).resolve('books/author/$username');
//       debugPrint('endpoint --- $endpoint');
//       final response = await http.get(
//         endpoint,
//         headers: {
//           'Authorization': 'Bearer $accessToken',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final jsonData = json.decode(response.body);
//         booksResponse = BooksResponse.fromJson(jsonData['data']);
//         isLoading = true;
//         debugPrint('Books res ------- $jsonData');
//         notifyListeners();
//         return ApiResponse(success: true, data: jsonData);
//       } else {
//         final jsonData = json.decode(response.body);
//         debugPrint('Books res failed ------- $response');
//         notifyListeners();
//         return ApiResponse(
//             success: false, message: 'Failed to fetch book', data: jsonData);
//       }
//     } catch (e) {
//       debugPrint('Error fetching book: $e');
//       return ApiResponse(success: false, message: 'Network error');
//     }
//   }
//
//   @override
//   void dispose() {
//     debugPrint("ViewLatestBookByAuthorVM disposed");
//     super.dispose();
//   }
// }

import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../../app/local_storage.dart';
import '../../core.dart';
import '../../models/books/books.dart';

// class ViewLatestBookByAuthorVM extends BaseVM {
//   BooksResponse? booksResponse;
//   bool isLoading = false;
//
//   Future<ApiResponse> viewBookByAuthor() async {
//     String? accessToken = await TokenManager.getAccessToken();
//     String baseUrl = dotenv.env['STAGING_URL'] ?? "";
//
//     User? user = LocalStorageHelper.getUser();
//     if (user == null) {
//       return ApiResponse(success: false, message: 'User not logged in');
//     }
//
//     String username = user.username;
//     debugPrint('Username--------- $username');
//
//     try {
//       Uri endpoint = Uri.parse(
//           '$baseUrl/books/author/$username');
//       debugPrint('endpoint --- $endpoint');
//       final response = await http.get(
//         endpoint,
//         headers: {
//           'Authorization': 'Bearer $accessToken',
//         },
//       );
//       debugPrint('endpoint --- ${json.decode(response.toString())}');
//
//       if (response.statusCode == 200) {
//         if (response.headers['content-type']?.contains('application/json') ??
//             false) {
//           final jsonData = json.decode(response.body);
//
//           booksResponse = BooksResponse.fromJson(jsonData['data']);
//           isLoading = true;
//           debugPrint('Books res ------- $jsonData');
//           notifyListeners();
//           return ApiResponse(success: true, data: jsonData);
//         } else {
//           debugPrint(
//               'Unexpected content type: ${response.headers['content-type']}');
//           return ApiResponse(
//               success: false, message: 'Unexpected response format');
//         }
//       } else {
//         debugPrint('Books res failed ------- ${response.body}');
//         notifyListeners();
//         return ApiResponse(
//             success: false,
//             message: 'Failed to fetch book',
//             data: response.body);
//       }
//     } catch (e) {
//       debugPrint('Error fetching book: $e');
//       return ApiResponse(success: false, message: 'Network error');
//     }
//   }
//
//   @override
//   void dispose() {
//     debugPrint("ViewLatestBookByAuthorVM disposed");
//     super.dispose();
//   }
// }

class ViewLatestBookByAuthorVM extends BaseVM {
  BooksResponse? booksResponse;
  bool isLoading = false;

  Future<ApiResponse> viewBookByAuthor() async {
    String? accessToken = await TokenManager.getAccessToken();
    String baseUrl = dotenv.env['STAGING_URL'] ?? "";

    User? user = LocalStorageHelper.getUser();
    if (user == null) {
      return ApiResponse(success: false, message: 'User not logged in');
    }

    String username = user.username;
    debugPrint('Username--------- $username');

    try {
      Uri endpoint = Uri.parse('$baseUrl/books/author/$username');
      debugPrint('Endpoint --- $endpoint');
      final response = await http.get(
        endpoint,
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      debugPrint('Raw response body: ${response.body}');

      if (response.statusCode == 200) {
        if (response.headers['content-type']?.contains('application/json') ?? false) {
          final jsonData = json.decode(response.body);
          debugPrint('Decoded JSON data: $jsonData');

          // Update this part based on your `BooksResponse` model structure
          if (jsonData['status'] == 'success' && jsonData['data'] != null) {
            booksResponse = BooksResponse.fromJson(jsonData['data']);
            isLoading = true;
            notifyListeners();
            return ApiResponse(success: true, data: jsonData);
          } else {
            return ApiResponse(success: false, message: jsonData['message'] ?? 'Unknown error');
          }
        } else {
          debugPrint('Unexpected content type: ${response.headers['content-type']}');
          return ApiResponse(success: false, message: 'Unexpected response format');
        }
      } else {
        debugPrint('Failed response body: ${response.body}');
        notifyListeners();
        return ApiResponse(success: false, message: 'Failed to fetch book', data: response.body);
      }
    } catch (e) {
      debugPrint('Error fetching book: $e');
      return ApiResponse(success: false, message: 'Network error');
    }
  }

  @override
  void dispose() {
    debugPrint("ViewLatestBookByAuthorVM disposed");
    super.dispose();
  }
}
