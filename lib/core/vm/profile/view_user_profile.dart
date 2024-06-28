import '../../core.dart';
import '../../models/user.dart';

class ViewUserProfileVM extends BaseVM {
  User? user;
  Future<ApiResponse> getUserProfile({required String token}) async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/profiles/profile/jeremy_essien',
      data: {},
      onSuccess: (data) {
        user = User.fromMap(data['data']);
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
