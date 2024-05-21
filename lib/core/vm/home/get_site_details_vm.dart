import '../../core.dart';

class GetSiteDetailsVM extends BaseVM {
  SiteDetails? siteDetails;
  Future<ApiResponse> getSiteDetails() async {
    return makeRequest(
      method: DioHttpMethod.GET,
      endpoint: '/general/site-detail',
      data: {},
      onSuccess: (data) {
        siteDetails = SiteDetails.fromMap(data['data']);
        printty(siteDetails, logLevel: 'Site details');
        notifyListeners();
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
