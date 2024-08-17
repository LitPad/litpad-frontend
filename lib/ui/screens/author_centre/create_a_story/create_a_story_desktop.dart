import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:litpad/core/models/books/books.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:provider/provider.dart';
import '../../../../core/core.dart';

class CreateStoryDesktop extends StatefulWidget {
  const CreateStoryDesktop({Key? key}) : super(key: key);

  @override
  State<CreateStoryDesktop> createState() => _CreateStoryDesktopState();
}

class _CreateStoryDesktopState extends State<CreateStoryDesktop> {
  final viewModel = ViewAvailableBooksGenreVM();
  final tagViewModel = ViewAvailableBooksTagVM();
  List<BookGenre> genres = [];
  List<Tag> tags = [];

  BookGenre? selectedGenre;
  Tag? selectedTag;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    viewModel.viewAvailableBooksGenre().then((response) {
      if (response.success) {
        genres = viewModel.bookGenre;
        if (genres.isNotEmpty) {
          selectedGenre = genres[0];
        }
        setState(() {});
      }
    });

    readJson().then((loadedTags) {
      setState(() {
        tags = loadedTags;
        if (tags.isNotEmpty) {
          selectedTag = tags[0];
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Consumer<CreateABookVM>(
          builder: (context, createBookVM, _) {
            return createBookVM.isBusy
                ? const Center(
                    child: SpinKitFadingCircle(
                    color: Colors.deepPurple,
                    size: 50.0,
                  ))
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      bookCover(createBookVM),
                      const XBox(40),
                      Container(
                        alignment: Alignment.center,
                        width: 636,
                        // height: 718,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.shade300,
                                width: 1,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                                top: 5,
                              ),
                              alignment: Alignment.bottomLeft,
                              child: const Text(
                                'Novel information',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Divider(
                              indent: 0,
                              endIndent: 0,
                              thickness: 0.8,
                              color: Colors.grey[300],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, right: 12),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Title',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                            ),
                                          ),
                                          XBox(5),
                                          Icon(
                                            Icons.info_outline_rounded,
                                            size: 15,
                                            color: AppColors.grey600,
                                          ),
                                        ],
                                      ),
                                      const YBox(5),
                                      CustomTextField(
                                          controller: createBookVM.titleC,
                                          borderRadius: 50,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your Title';
                                            }
                                            return null;
                                          }),
                                      const YBox(20),
                                      const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Blurb',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                            ),
                                          ),
                                          XBox(5),
                                          Icon(
                                            Icons.info_outline_rounded,
                                            size: 15,
                                            color: AppColors.grey600,
                                          ),
                                        ],
                                      ),
                                      const YBox(5),
                                      TextFormField(
                                          controller: createBookVM.blurbC,
                                          maxLines: 4,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                width: 0.5,
                                                color: AppColors.grey300,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: AppColors.grey300,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                width: 1,
                                                color: AppColors.grey300,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your blurb';
                                            }
                                            return null;
                                          }),
                                      const YBox(20),
                                      const Text(
                                        'Tags',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                      const YBox(5),
                                      Container(
                                        height: 45,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          border: Border.all(
                                              color: Colors.grey[300]!,
                                              width: 1.0),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<Tag>(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            value: selectedTag,
                                            icon: const Icon(Icons
                                                .keyboard_arrow_down_outlined),
                                            iconSize: 24.0,
                                            elevation: 0,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            underline: Container(),
                                            onChanged: (Tag? newValue) {
                                              setState(() {
                                                selectedTag = newValue!;
                                                createBookVM.tagSlugs =
                                                    newValue.slug;
                                              });
                                            },
                                            isExpanded: false,
                                            // alignment: Alignment.centerRight,
                                            items: tags
                                                .map<DropdownMenuItem<Tag>>(
                                                    (Tag tag) {
                                              return DropdownMenuItem<Tag>(
                                                value: tag,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0),
                                                  child: Text(
                                                    tag.name,
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      const YBox(20),
                                      const Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Genre',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 15,
                                            ),
                                          ),
                                          XBox(5),
                                          Icon(
                                            Icons.info_outline_rounded,
                                            size: 15,
                                            color: AppColors.grey600,
                                          ),
                                        ],
                                      ),
                                      const YBox(5),
                                      Container(
                                        height: 45,
                                        width: double.maxFinite,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                          border: Border.all(
                                              color: Colors.grey[300]!,
                                              width: 1.0),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<BookGenre>(
                                              padding: const EdgeInsets.only(
                                                  right: 15),
                                              value: selectedGenre,
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down_outlined),
                                              iconSize: 24.0,
                                              elevation: 0,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                              underline: Container(),
                                              onChanged: (BookGenre? newValue) {
                                                setState(() {
                                                  selectedGenre = newValue!;
                                                  Provider.of<CreateABookVM>(
                                                              context,
                                                              listen: false)
                                                          .genre =
                                                      newValue.slug ?? '';
                                                });
                                              },
                                              isExpanded: false,
                                              alignment: Alignment.centerRight,
                                              items: genres.map<
                                                      DropdownMenuItem<
                                                          BookGenre>>(
                                                  (BookGenre genre) {
                                                return DropdownMenuItem<
                                                    BookGenre>(
                                                  value: genre,
                                                  child: Text(genre.name),
                                                );
                                              }).toList()),
                                        ),
                                      ),
                                      const YBox(20),
                                    ]),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 15.0, top: 10),
                              child: Text(
                                'Age discretion',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Radio<int>(
                                          value: 4,
                                          groupValue: createBookVM
                                              .selectedAgeDiscretion,
                                          onChanged: (int? value) {
                                            setState(() {
                                              createBookVM
                                                      .selectedAgeDiscretion =
                                                  value!;
                                            });
                                          },
                                        ),
                                        const Text('+4'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Radio<int>(
                                          value: 12,
                                          groupValue: createBookVM
                                              .selectedAgeDiscretion,
                                          onChanged: (int? value) {
                                            setState(() {
                                              createBookVM
                                                      .selectedAgeDiscretion =
                                                  value!;
                                            });
                                          },
                                        ),
                                        const Text('+12'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Radio<int>(
                                          value: 16,
                                          groupValue: createBookVM
                                              .selectedAgeDiscretion,
                                          onChanged: (int? value) {
                                            setState(() {
                                              createBookVM
                                                      .selectedAgeDiscretion =
                                                  value!;
                                            });
                                          },
                                        ),
                                        const Text('+16'),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15),
                                    child: Row(
                                      children: [
                                        Radio<int>(
                                          value: 18,
                                          groupValue: createBookVM
                                              .selectedAgeDiscretion,
                                          onChanged: (int? value) {
                                            setState(() {
                                              createBookVM
                                                      .selectedAgeDiscretion =
                                                  value!;
                                            });
                                          },
                                        ),
                                        const Text('+18'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Divider(
                              indent: 0,
                              endIndent: 0,
                              thickness: 0.8,
                              color: Colors.grey[300],
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              margin: const EdgeInsets.only(
                                  top: 10, right: 20, bottom: 50),
                              child: CustomBtn.solid(
                                  width: 108,
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await createBookVM.uploadData();
                                    }
                                  },
                                  online: true,
                                  text: 'Create'),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }

  Widget bookCover(CreateABookVM createBookVM) {
    return Column(
      children: [
        Container(
          height: 240,
          width: 202,
          decoration: BoxDecoration(
            color: AppColors.purple50,
            border: Border.all(color: AppColors.purple100, width: 0.5),
            borderRadius: BorderRadius.circular(8),
            image: createBookVM.imageData != null
                ? (kIsWeb)
                    ? DecorationImage(
                        fit: BoxFit.fill,
                        image: MemoryImage(createBookVM.imageData!),
                      )
                    : DecorationImage(
                        fit: BoxFit.contain,
                        image: MemoryImage(createBookVM.imageData!),
                      )
                : null,
          ),
        ),
        const YBox(20),
        CustomBtn.solid(
          height: 40,
          onTap: createBookVM.pickImage,
          online: true,
          text: 'Upload cover',
        ),
      ],
    );
  }
}

Future<List<Tag>> readJson() async {
  final String response = await rootBundle.loadString('book_tags.json');
  final data = await json.decode(response);
  List<dynamic> tagsJson = data['data'];
  List<Tag> tags = tagsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
  return tags;
}
