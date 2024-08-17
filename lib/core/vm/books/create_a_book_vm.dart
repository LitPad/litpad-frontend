import 'dart:convert';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:universal_html/html.dart';
import '../../core.dart';
import 'package:http/http.dart' as http;

//Todo: Finalise implementation and fix bug
class CreateABookVM extends BaseVM {
  int? selectedAgeDiscretion;
  String genre = '';
  String tagSlugs = 'campus';
  Uint8List? _imageData;
  String? _fileName;
  TextEditingController priceC = TextEditingController();
  TextEditingController titleC = TextEditingController();
  TextEditingController blurbC = TextEditingController();
  TextEditingController chapterTitleC = TextEditingController();
  TextEditingController chapterTextC = TextEditingController();

  Uint8List? get imageData => _imageData;
  Future<void> pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      _imageData = result.files.first.bytes;
      _fileName = result.files.first.name;
      notifyListeners();
    }
  }

  Future uploadData() async {
    String? accessToken = await TokenManager.getAccessToken();
    String baseUrl = await dotenv.env['STAGING_URL'] ?? "";
    debugPrint('accessToken ------ $accessToken');

    if (_imageData == null) {
      return;
    }

    final uri = Uri.parse('$baseUrl/books');
    debugPrint('Url------$uri');
    final request = http.MultipartRequest('POST', uri)
      ..fields['age_discretion'] = selectedAgeDiscretion.toString()
      ..fields['blurb'] = blurbC.text.trim()
      ..fields['genre_slug'] = genre
      ..fields['price'] = '10'
      ..fields['tag_slugs'] = tagSlugs
      ..fields['title'] = titleC.text.trim()
      ..files.add(http.MultipartFile.fromBytes(
        'cover_image',
        _imageData!,
        filename: _fileName,
      ));

    debugPrint('Request fields ----- ${request.fields}');
    debugPrint('Request files ----- ${request.files}');
    request.headers['Authorization'] = 'Bearer $accessToken';

    try {
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      debugPrint('Response status code: ${response.statusCode}');
      debugPrint('Response body: $responseBody');

      final Map<String, dynamic> responseData = jsonDecode(responseBody);

      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('Upload successful');
        showSuccessSnackbar(
            responseData['message'] ?? 'Book created successfully');
        notifyListeners();
      } else if (response.statusCode == 401) {
        debugPrint('Token expired, attempting to refresh...');
        showFailureSnackbar('${responseData['message'] ?? 'Unauthorized'}');

        accessToken = await TokenManager.refreshAccessToken();
        if (accessToken != null) {
          request.headers['Authorization'] = 'Bearer $accessToken';
          final retryResponse = await request.send();
          final retryResponseBody = await retryResponse.stream.bytesToString();

          debugPrint('Retry response status code: ${retryResponse.statusCode}');
          debugPrint('Retry response body: $retryResponseBody');

          if (retryResponse.statusCode == 200) {
            debugPrint('Retry upload successful');
            showSuccessSnackbar('Retry upload successful');
          } else {
            debugPrint(
                'Retry upload failed with status: ${retryResponse.statusCode}');
            showFailureSnackbar('Retry upload failed');
          }
        } else {
          debugPrint('Failed to refresh access token');
          showFailureSnackbar('Failed to refresh access token');
        }
      } else {
        debugPrint('Upload failed with status: ${response.statusCode}');
        showFailureSnackbar('Upload failed');
      }
    } catch (e) {
      debugPrint('Exception during upload: $e');
      showFailureSnackbar('Exception during upload: $e');
    }
  }

  @override
  void dispose() {
    printty("CreateABookVM disposed");
    titleC.dispose();
    chapterTextC.dispose();
    chapterTitleC.dispose();
    blurbC.dispose();
    super.dispose();
  }
}

void showSuccessSnackbar(String message) {
  debugPrint('Success dialog');
  final context = NavigatorKeys.appNavigatorKey.currentContext;

  if (context != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }
}

void showFailureSnackbar(String message) {
  debugPrint('Failure dialog');

  final context = NavigatorKeys.appNavigatorKey.currentContext;
  if (context != null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.red,
      ),
    );
  }
}
