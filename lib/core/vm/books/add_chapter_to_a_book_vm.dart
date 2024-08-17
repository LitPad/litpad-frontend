import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../../core.dart';

// class AddChapterToBookVM extends BaseVM {
//   final TextEditingController chapterTextC = TextEditingController();
//   final TextEditingController titleTextC = TextEditingController();
//
//
//
//   Future<ApiResponse> addChapterToBook(String bookSlug) async {
//     return makeRequest(
//       method: DioHttpMethod.POST,
//       endpoint: '/books/book/$bookSlug/add-chapter',
//       data: {
//         'text' : chapterTextC.text.trim(),
//         'title' : chapterTextC.text.trim(),
//       },
//       onSuccess: (data) {
//         // bookGenre = (data['data'] as List)
//         //     .map((genre) => BookGenre.fromJson(genre))
//         //     .toList();
//
//         notifyListeners();
//         return ApiResponse(success: true, data: data);
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     printty("SignUpVM disposed");
//     super.dispose();
//   }
// }

class AddChapterToBookVM extends BaseVM {
  final TextEditingController chapterTextC = TextEditingController();
  final TextEditingController titleTextC = TextEditingController();

  Future<ApiResponse> addChapterToBook(String bookSlug) async {
    String? accessToken = await TokenManager.getAccessToken();
    String baseUrl = dotenv.env['STAGING_URL'] ?? "";

    final chapterData = {
      "chapter_status": "DRAFT",
      "text": chapterTextC.text.trim(),
      "title": titleTextC.text.trim(),
    };
    try {
      Uri endpoint = Uri.parse('$baseUrl/books/book/$bookSlug/add-chapter');
      debugPrint('endpoint --- $endpoint');
      debugPrint('endpoint --- $accessToken');

      final response = await http.post(
        endpoint,
        headers: {
          'Authorization': 'Bearer $accessToken',
          'Content-Type': 'application/json',
        },
        body: chapterData,

        // body: jsonEncode({
        //   "chapter_status": "DRAFT",
        //   'text': jsonEncode(chapterTextC.text.trim()),
        //   'title': titleTextC.text.trim(),
        // }),
      );

      debugPrint('Input data --- $chapterData');
      debugPrint('Add chapter res ------- ${json.decode(response.body)}');

      if (response.statusCode == 200) {
        if (response.headers['content-type']?.contains('application/json') ??
            false) {
          final jsonData = json.decode(response.body);
          notifyListeners();
          return ApiResponse(success: true, data: jsonData);
        } else {
          debugPrint(
              'Unexpected content type: ${response.headers['content-type']}');
          return ApiResponse(
              success: false, message: 'Unexpected response format');
        }
      } else {
        debugPrint('Add chapter failed ------- ${response.body}');
        notifyListeners();
        return ApiResponse(
            success: false,
            message: 'Failed to add chapter',
            data: response.body);
      }
    } catch (e) {
      debugPrint('Error adding chapter: $e');
      return ApiResponse(success: false, message: 'Network error');
    }
  }

  @override
  void dispose() {
    debugPrint("AddChapterToBookVM disposed");
    super.dispose();
  }
}
