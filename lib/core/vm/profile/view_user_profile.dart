import '../../core.dart';
import '../../models/user.dart';

class ViewUserProfileVM extends BaseVM {
  Future<ApiResponse> getUserProfile({required String token}) async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/profiles/profile/jeremy_essien',
      data: {},
      onSuccess: (data) {
        notifyListeners();
        return ApiResponse(success: true, data: data);
      },
    );
  }

  //Todo: Fix user profile coming as null

  @override
  void dispose() {
    printty("ViewUserProfileVM  disposed");
    super.dispose();
  }
}
