import 'package:litpad/core/core.dart';

import '../service/toast_service.dart';

class BaseVM extends ChangeNotifier {
  late ApiResponse apiResponse;
  final dioService = DioService();
  final toast = ToastService();

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
    Map<String, dynamic>? data,
    required ApiResponse Function(dynamic) onSuccess,
  }) async {
    try {
      setBusy(true);
      final response = await dioService.request(
        method,
        endpoint,
        data: data,
        accessToken: accessToken,
      );
      setBusy(false);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 204) {
        printty(response.data, logLevel: endpoint);
        apiResponse = ApiResponse(success: true, data: response.data);
        toast.show(response.data['message']);

        return onSuccess(apiResponse.data);
      } else {
        setError(true);
        printty('An error else: ${response.data}', logLevel: endpoint);
        toast.show(response.data['message'] ?? 'An error occurred');
        return apiResponse = ApiResponse(
            success: true,
            data: response.data,
            message: response.data['message'] ?? 'An error occurred');
      }
    } catch (e) {
      toast.show('An error occurred');
      setError(true);
      setBusy(false);
      printty('An error catch: $e', logLevel: endpoint);
      return apiResponse = ApiResponse(success: false, message: e.toString());
    }
  }
}
