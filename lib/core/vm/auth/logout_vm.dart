import '../../core.dart';

class LogoutVM extends BaseVM {

  Future<ApiResponse> logout() async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: 'auth/logout',
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
