import 'package:flutter_svg/flutter_svg.dart';
import 'package:litpad/core/models/books/book_genre_model.dart';
import 'package:litpad/ui/components/components.dart';

import '../../../../core/core.dart';

class CreateStoryDesktop extends StatefulWidget {
  const CreateStoryDesktop({Key? key}) : super(key: key);

  @override
  State<CreateStoryDesktop> createState() => _CreateStoryDesktopState();
}

class _CreateStoryDesktopState extends State<CreateStoryDesktop> {
  final _formKey = GlobalKey<FormState>();
  late String _selectedItem;
  final List<String> _dropdownItems = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewAvailableBooksGenreVM();
    return Scaffold(
      body: Padding(
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
                            const CustomTextField(
                              borderRadius: 50,
                            ),
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
                            const CustomTextField(
                              borderRadius: 50,
                            ),
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
                            CustomDropdownContainer(viewModel: viewModel,),
                            // Container(
                            //   padding: const EdgeInsets.symmetric(
                            //       horizontal: 20, vertical: 10),
                            //   decoration: BoxDecoration(
                            //     color: Colors.wh
                            //     ite,
                            //     borderRadius: BorderRadius.circular(50),
                            //     border: Border.all(color: Colors.grey),
                            //   ),
                            //   child: DropdownButtonHideUnderline(
                            //     child: DropdownButton<String>(
                            //       value: _selectedItem,
                            //       hint: const Text('Select an item'),
                            //       items: _dropdownItems.map((String value) {
                            //         return DropdownMenuItem<String>(
                            //           value: value,
                            //           child: Text(value),
                            //         );
                            //       }).toList(),
                            //       onChanged: (newValue) {
                            //         setState(() {
                            //           _selectedItem = newValue??'';
                            //         });
                            //       },
                            //       icon: const Icon(
                            //           Icons.keyboard_arrow_down_outlined),
                            //       iconSize: 24,
                            //       elevation: 16,
                            //       style: const TextStyle(
                            //         color: Colors.black,
                            //       ),
                            //       underline: Container(
                            //         height: 0,
                            //       ),
                            //       dropdownColor: Colors.white,
                            //     ),
                            //   ),
                            // ),
                            // const CustomTextField(
                            //   borderRadius: 50,
                            //   suffixIcon:
                            //       Icon(Icons.keyboard_arrow_down_outlined),
                            // ),
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
                            const YBox(20),
                            CustomTextField(
                              borderRadius: 50,
                              suffixIcon: Icon(
                                Icons.keyboard_arrow_down_outlined,
                                color: Colors.grey[300],
                              ),
                            ),
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
                          onTap: () {},
                          online: true,
                          text: 'Create',
                          width: 108,
                          height: 47)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bookCover() {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            width: 202,
            height: 186,
            decoration: BoxDecoration(
                color: AppColors.purple50,
                border: Border.all(color: AppColors.purple100, width: 0.5)
                // image: DecorationImage(
                //     image: AssetImage('assets/images/logo.jpg'))
                ),
          ),
        ),
        const YBox(20),
        CustomBtn.solid(
            height: 40,
            onTap: () {},
            online: true,
            text: 'Upload cover',
            icon: SvgPicture.asset(
              'assets/svgs/upload.svg',
              height: 20,
              width: 20,
            ))
      ],
    );
  }

  Widget buildCustomCheckbox({required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          shape: const CircleBorder(),
          value: false,
          onChanged: (val) {},
          activeColor: Colors.blue,
        ),
        const SizedBox(width: 5),
        Text(text),
      ],
    );
  }
}

class CustomDropdownContainer extends StatefulWidget {
  final ViewAvailableBooksGenreVM viewModel;

  const CustomDropdownContainer({Key? key, required this.viewModel}) : super(key: key);

  @override
  State<CustomDropdownContainer> createState() =>
      _CustomDropdownContainerState();
}

class _CustomDropdownContainerState extends State<CustomDropdownContainer> {
  String dropdownValue = "All";

  @override
  void initState() {
    super.initState();
    widget.viewModel.viewAvailableBooksGenre().then((_) => setState(() {}));
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        // color: Colors.grey[200], // Adjust color as needed
        border: Border.all(
          color: Colors.grey.shade200, // Remove underline
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          iconSize: 24.0,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(), // Remove underline again
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: widget.viewModel.bookGenre.isEmpty? [

            DropdownMenuItem<String>(
              value: "",
              child: const Text("Loading..."),
            ),

          ]: widget.viewModel.bookGenre.map<DropdownMenuItem<String>>((BookGenre genre) {
            return DropdownMenuItem<String>(
              value: genre.name,
              child: Text(genre.name),
            );
          }).toList(),
          isExpanded: false, // Prevent dropdown from expanding
          alignment: Alignment.centerRight, // Center arrow
        ),
      ),
    );
  }
}
