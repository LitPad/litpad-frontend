import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../app/local_storage.dart';
import '../../core.dart';
import 'package:http/http.dart' as http;

import '../../models/books/books.dart';

class ViewLatestBookByAuthorVM extends BaseVM {
  BooksResponse? booksResponse;
  bool isLoading = false;

  Future<ApiResponse> viewBookByAuthor() async {
    String? accessToken = await TokenManager.getAccessToken();
    String baseUrl = await dotenv.env['STAGING_URL'] ?? "";

    User? user = LocalStorageHelper.getUser();
    if (user == null) {
      return ApiResponse(success: false, message: 'User not logged in');
    }

    String username = user.username;
    debugPrint('Username--------- $username');

    try {
      Uri endpoint = Uri.parse(baseUrl).resolve('books/author/$username');
      debugPrint('endpoint --- $endpoint');
      final response = await http.get(
        endpoint,
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        booksResponse = BooksResponse.fromJson(jsonData['data']);
        isLoading = true;
        debugPrint('Books res ------- $jsonData');
        notifyListeners();
        return ApiResponse(success: true, data: jsonData);
      } else {
        final jsonData = json.decode(response.body);
        debugPrint('Books res failed ------- $response');
        notifyListeners();
        return ApiResponse(
            success: false, message: 'Failed to fetch book', data: jsonData);
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
