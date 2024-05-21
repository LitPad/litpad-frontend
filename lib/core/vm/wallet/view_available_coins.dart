import '../../core.dart';

class ViewAvailableCoinsVM extends BaseVM {
  Future<ApiResponse> getSiteDetails({required String token}) async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/wallet/coins',
      data: {},
      onSuccess: (data) {
        return ApiResponse(success: true, data: data);
      },
    );
  }

  @override
  void dispose() {
    printty("SignUpVM disposed");
    super.dispose();
  }
}
