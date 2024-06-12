import '../../core.dart';

class SiteHealthCheckVM extends BaseVM {
  Future<ApiResponse> siteHealthCheck() async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/healthcheck',
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
