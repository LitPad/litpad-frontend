import '../../core.dart';

class AddSubscriberVM extends BaseVM {
  bool isSuccess = false;
  TextEditingController emailC = TextEditingController();

  Future<ApiResponse> addSubscriber() async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/general/subscribe',
      data: {
        "email": emailC.text.trim(),
      },
      onSuccess: (data) {
        isSuccess = true;
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
