import '../../core.dart';

class WalletTransactionsVM extends BaseVM {
  Future<ApiResponse> getSiteDetails({required String token}) async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/wallet/transactions',
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
