import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:litpad/core/core.dart';

import '../service/toast_service.dart';

class BaseVM extends ChangeNotifier {
  late ApiResponse apiResponse;
  final dioService = DioService();

  bool _isBusy = false;
  bool get isBusy => _isBusy;

  bool _hasError = false;
  bool get hasError => _hasError;

  void setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }

  void setError(bool value) {
    _hasError = value;
    notifyListeners();
  }

  notify() {
    notifyListeners();
  }

  Future<ApiResponse> makeRequest({
    required String method,
    required String endpoint,
    String? accessToken,
    dynamic data,
    // Map<String, dynamic>? data,
    bool isMultipart = false,
    required ApiResponse Function(dynamic) onSuccess,
  }) async {
    try {
      setBusy(true);
      final response = await dioService.request(method, endpoint,
          data: isMultipart == true
              ? FormData.fromMap(data as Map<String, dynamic>)
              : data,
          accessToken: accessToken,
          isMultipart: isMultipart);
      setBusy(false);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        printty(response.data, logLevel: endpoint);
        apiResponse = ApiResponse(success: true, data: response.data);

        return onSuccess(apiResponse.data);
      } else {
        setError(true);
        apiResponse = ApiResponse(
            success: false,
            data: response.data,
            message: response.data['message'] ?? 'An error occurred');
        printty('An error else: ${apiResponse.data}', logLevel: endpoint);

        return apiResponse;
      }
    } catch (e) {
      setError(true);
      setBusy(false);
      String errorMessage = 'An error occurred';
      if (e is DioException && e.response != null) {
        errorMessage = e.response!.data['message'] ?? errorMessage;
      }
      apiResponse = ApiResponse(success: false, message: errorMessage);
      return apiResponse;
    }
    // catch (e) {
    //   toast.show('An error occurred');
    //   setError(true);
    //   setBusy(false);
    //   printty('An error catch: $e', logLevel: endpoint);
    //   return apiResponse = ApiResponse(success: false, message: e.toString());
    // }
  }
}
