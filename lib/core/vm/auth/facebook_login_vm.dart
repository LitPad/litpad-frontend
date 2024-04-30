import '../../core.dart';

class FaceBookLoginVM extends BaseVM {

  Future<ApiResponse> faceBookLogin() async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/auth/facebook',
      data: {},
      onSuccess: (data) {
        // Store the access token
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
