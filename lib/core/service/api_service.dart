import 'package:dio/dio.dart';

// import 'package:http/http.dart' as http;

import '../../ui/components/components.dart';

enum HttpMethod {
  get,
  post,
  patch,
}

class ApiService {
  final _apiHost = '';

  //Todo: Make toast service
  // final _toast = locator<ToastService>();

  void printApiCallDetails() {}

  Future<dynamic> call({
    required HttpMethod method,
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    Map<String, String>? additionalHeaders,
    bool showToast = true,
  }) async {
    assert(method != HttpMethod.post ||
        (method == HttpMethod.post && body != null));

    final headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'X-Requested-With': 'XmlHttpRequest',
      if (additionalHeaders != null) ...additionalHeaders,
    };

    final uri = Uri.https(_apiHost, '/api/v1$path', queryParameters);

    // try {
    //   final res = method == HttpMethod.get
    //       ? await http.get(uri, headers: headers)
    //       : method == HttpMethod.patch
    //           ? await http.patch(uri, headers: headers, body: body)
    //           : await http.post(uri, headers: headers, body: jsonEncode(body));

    //   if (res.statusCode >= 500) {
    //     if (showToast) {
    //       //Todo: Handle toast for errors
    //       printApiCallDetails();
    //       // _toast.show('Something went wrong, while processing your request');
    //     }
    //   } else {
    //     final responseBody = jsonDecode(res.body);
    //     //Todo: Process response here...
    //   }
    // } on http.ClientException catch (_) {
    //   //Todo: Handle ClientException...
    // } on FormatException {
    //   //Todo: Handle FormatException...
    // } on SocketException {
    //   //Todo: Handle SocketException...
    // } catch (error) {
    //   //Todo: Handle other exceptions...
    // }
  }

  Future makeApiCall({
    required Map<String, dynamic> requestBody,
    required String url,
    Response? response,
  }) async {
    //Todo: Implement this function to always log api details

    try {
      Dio dio = Dio();

      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Requested-With': 'XmlHttpRequest',
        //Todo: Setup AuthService and tokenization
        // 'Authorization': 'Bearer ${locator<AuthService>().currentUser?.token}',
      };

      response = await dio.post(url, data: requestBody);

      if (response.statusCode == 200) {
        //Todo: Process successful response...
      } else {
        //Todo: Handle unsuccessful response...
      }
    } catch (e) {
      debugPrint('Error ==> $e');
    }
  }

  dioGet(String getUrl) async {
    try {
      Dio dio = Dio();

      dio.options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'X-Requested-With': 'XmlHttpRequest',
        //Todo: Setup AuthService and tokenization
        // 'Authorization': 'Bearer ${locator<AuthService>().currentUser?.token}',
      };

      final response = await dio.get(getUrl);

      final resBody = response.data;

      if (resBody['status'] == true) {
        //Todo: Process successful response...
      } else {
        //Todo: Handle unsuccessful response...
      }
    } catch (e) {
      debugPrint('Res error ==> $e');
    }
  }
}
