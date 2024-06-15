import '../../core.dart';

//Todo: Finalise implementation
class CreateABookVM extends BaseVM {
  TextEditingController ageDiscretionC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController titleC = TextEditingController();
  TextEditingController chapterTitleC = TextEditingController();
  TextEditingController chapterTextC = TextEditingController();
  Future<ApiResponse> createABook() async {
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/books',
      data: {
        "age_discretion " : ageDiscretionC.text.trim(),
        "price" : priceC.text.trim(),
        "title" : titleC.text.trim(),
        "chapter_title" : chapterTitleC.text.trim(),
        "chapter_text" : chapterTextC.text.trim(),
      },
      onSuccess: (data) {
        notifyListeners();
        return ApiResponse(success: true, data: data);
      },
    );
  }

  @override
  void dispose() {
    printty("CreateABookVM disposed");
    titleC.dispose();
    chapterTextC.dispose();
    chapterTitleC.dispose();
    ageDiscretionC.dispose();
    super.dispose();
  }
}
