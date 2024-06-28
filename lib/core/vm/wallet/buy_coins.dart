import '../../core.dart';

class BuyCoinsVM extends BaseVM {
  TextEditingController coinIdC = TextEditingController();
  TextEditingController paymentTypeC = TextEditingController();

  Future<ApiResponse> getSiteDetails({required String token}) async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/wallet/coins',
      data: {
        "coin_id": coinIdC.text.trim(),
        "payment_type": paymentTypeC.text.trim()
      },
      onSuccess: (data) {
        return ApiResponse(success: true, data: data);
      },
    );
  }

  @override
  void dispose() {
    printty("SignUpVM disposed");
    coinIdC.dispose();
    paymentTypeC.dispose();
    super.dispose();
  }
}
