import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:provider/provider.dart';
import '../../../../core/core.dart';

class CreateStoryDesktop extends StatefulWidget {
  const CreateStoryDesktop({Key? key}) : super(key: key);

  @override
  State<CreateStoryDesktop> createState() => _CreateStoryDesktopState();
}

class _CreateStoryDesktopState extends State<CreateStoryDesktop> {
  final _formKey = GlobalKey<FormState>();
  final viewModel = ViewAvailableBooksGenreVM();
  List<String> dropdownItems = [];
  String dropdownValue = "Werewolf";

  @override
  void initState() {
    super.initState();
    viewModel.viewAvailableBooksGenre().then((response) {
      if (response.success) {
        dropdownItems = viewModel.bookGenre.map((genre) => genre.name).toList();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CreateABookVM>(builder: (context, createBookVM, _) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bookCover(),
              const XBox(40),
              Container(
                alignment: Alignment.center,
                width: 636,
                height: 718,
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
                      padding: const EdgeInsets.only(left: 12.0, right: 12),
                      child: Form(
                        key: _formKey,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your Title';
                                    }
                                    return null;
                                  }),
                              const YBox(20),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Chapter Title',
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
                                  controller: createBookVM.chapterTitleC,
                                  borderRadius: 50,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your chapter title';
                                    }
                                    return null;
                                  }),
                              const YBox(20),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Price',
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
                                  controller: createBookVM.priceC,
                                  borderRadius: 50,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your price';
                                    }
                                    return null;
                                  }),
                              const YBox(20),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                              CustomTextField(
                                  controller: createBookVM.blurbC,
                                  borderRadius: 50,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your blurb';
                                    }
                                    return null;
                                  }),
                              const YBox(20),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                                  borderRadius: BorderRadius.circular(50.0),
                                  border: Border.all(
                                      color: Colors.grey[300]!, width: 1.0),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                      value: dropdownValue,
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_outlined),
                                      iconSize: 24.0,
                                      elevation: 0,
                                      style:
                                          const TextStyle(color: Colors.black),
                                      underline: Container(),
                                      onChanged: (String? newValue) {
                                        setState(() {
                                          dropdownValue = newValue!;
                                          Provider.of<CreateABookVM>(context,
                                                  listen: false)
                                              .genre = newValue;
                                        });
                                      },
                                      isExpanded:
                                          false, // Prevent dropdown from expanding
                                      alignment: Alignment.centerRight,
                                      items: dropdownItems
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList() // Center arrow
                                      ),
                                ),
                              ),
                              const YBox(20),
                              const Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Pages',
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
                                  borderRadius: 50,
                                  suffixIcon: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: Colors.grey[300],
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your page';
                                    }
                                    return null;
                                  }),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildCustomCheckbox(text: '+4'),
                        buildCustomCheckbox(text: '+12'),
                        buildCustomCheckbox(text: '+16'),
                        buildCustomCheckbox(text: '+18'),
                      ],
                    ),
                    Divider(
                      indent: 0,
                      endIndent: 0,
                      thickness: 0.8,
                      color: Colors.grey[300],
                    ),
                    Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.only(right: 10),
                        child: CustomBtn.solid(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                createBookVM.createABook().then((response) {
                                  if (response.success) {
                                    debugPrint(
                                        'Create book res ===> $response');
                                  } else {}
                                });
                              }
                            },
                            online: true,
                            text: 'Create',
                            width: 108,
                            height: 47)),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget bookCover() {
    final picker = ImagePicker();
    XFile? image = Provider.of<CreateABookVM>(context).image;

    Future pickImage() async {
      image = await picker.pickImage(source: ImageSource.gallery);
      var imagePath = await image!.readAsBytes();

      setState(() {});
      debugPrint('image file ==> ${image?.path.toString()}');
      Provider.of<CreateABookVM>(context, listen: false).image = XFile(image!.path);
    }

    return Column(
      children: [
        GestureDetector(
          onTap: pickImage,
          child: Container(
            width: 202,
            height: 186,
            decoration: BoxDecoration(
              color: AppColors.purple50,
              border: Border.all(color: AppColors.purple100, width: 0.5),
              image: (image != null)
                  ? (kIsWeb)
                      ? DecorationImage(
                          image: NetworkImage(image!.path),
                          fit: BoxFit.cover,
                        )
                      : DecorationImage(
                          image: FileImage(File(image!.path)),
                          fit: BoxFit.cover,
                        )
                  : null,
            ),
          ),
        ),
        const YBox(20),
        CustomBtn.solid(
          height: 40,
          onTap: () {},
          online: true,
          text: 'Upload cover',
          // icon: SvgPicture.asset(
          //   'assets/svgs/upload.svg',
          //   height: 20,
          //   width: 20,
          // ),
        )
      ],
    );
  }

  Widget buildCustomCheckbox({required String text}) {
    bool isSelected = false;
    return Consumer<CreateABookVM>(builder: (context, createABookVm, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            shape: const CircleBorder(),
            value: isSelected,
            onChanged: (val) => setState(() {
              isSelected = val!;
              createABookVm.selectedAgeDiscretion = text;

              printty(createABookVm.selectedAgeDiscretion,
                  logLevel: 'Selected age');
            }),
            activeColor: AppColors.primaryPurple,
          ),
          const SizedBox(width: 5),
          Text(text),
        ],
      );
    });
  }
}
