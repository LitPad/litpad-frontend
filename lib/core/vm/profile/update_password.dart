import '../../core.dart';

class UpdatePasswordVM extends BaseVM {
  Future<ApiResponse> getSiteDetails({required String token}) async {
    return makeRequest(
      method: DioHttpMethod.PUT,
      endpoint: '/profiles/update-password',
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
