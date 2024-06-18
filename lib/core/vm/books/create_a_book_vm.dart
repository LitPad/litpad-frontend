import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

import '../../core.dart';

//Todo: Finalise implementation
class CreateABookVM extends BaseVM {
  String selectedAgeDiscretion = '';
  String genre = '';
  XFile? image;

  TextEditingController priceC = TextEditingController();
  TextEditingController titleC = TextEditingController();
  TextEditingController blurbC = TextEditingController();
  TextEditingController chapterTitleC = TextEditingController();
  TextEditingController chapterTextC = TextEditingController();
  // int? ageDiscretion;

  Future<ApiResponse> createABook() async {
    final data = {
      "age_discretion ": selectedAgeDiscretion,
      "price": priceC.text.trim(),
      "genre_slug": genre,
      "tag_slugs": ['One, two'],
      "title": titleC.text.trim(),
      "chapter_title": chapterTitleC.text.trim(),
      "chapter_text": chapterTextC.text.trim(),
      "cover_image": image?.readAsBytes()
      // await dio.MultipartFile.fromFile(image!.path, filename: 'coverImage.jpg')
    };
    return makeRequest(
      method: DioHttpMethod.POST,
      endpoint: '/books',
      data: data,
      // {
      //   "age_discretion " : selectedAgeDiscretion,
      //   "price" : priceC.text.trim(),
      //   "genre_slug" : genre,
      //   "tag_slugs" : ['One, two'],
      //   "title" : titleC.text.trim(),
      //   "chapter_title" : chapterTitleC.text.trim(),
      //   "chapter_text" : chapterTextC.text.trim(),
      //   "cover_image" : image
      // },

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
    blurbC.dispose();
    super.dispose();
  }
}
