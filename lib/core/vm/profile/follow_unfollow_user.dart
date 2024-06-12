import '../../core.dart';

class FollowAndUnfollowVM extends BaseVM {
  Future<ApiResponse> getSiteDetails({required String token}) async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/profiles/profile/{username}/follow',
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
