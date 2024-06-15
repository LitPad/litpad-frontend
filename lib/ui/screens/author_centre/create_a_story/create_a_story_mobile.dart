
import 'package:flutter_svg/svg.dart';

import '../../../../core/core.dart';
import '../../../ui.dart';

class CreateStoryMobile extends StatefulWidget {
  const CreateStoryMobile({Key? key}) : super(key: key);

  @override
  State<CreateStoryMobile> createState() => _CreateStoryMobileState();
}

class _CreateStoryMobileState extends State<CreateStoryMobile> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            bookCoverMobile(),
            const XBox(40),
            Container(
              alignment: Alignment.center,
              width: 358,
              // height: 615,
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
                                  color: AppColors.grey300,
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
                                  color: AppColors.grey300,
                                ),
                              ],
                            ),
                            const YBox(5),
                            const CustomTextField(
                              maxLines: 5,
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
                                  color: AppColors.grey300,
                                ),
                              ],
                            ),
                            const YBox(5),
                            const CustomTextField(
                              borderRadius: 50,
                              suffixIcon:
                              Icon(Icons.keyboard_arrow_down_outlined),
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
                                  color: AppColors.grey300,
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                      margin: const EdgeInsets.only(right: 10, left: 10),
                      child: CustomBtn.solid(
                          onTap: () {},
                          online: true,
                          text: 'Create',
                          height: 41)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bookCoverMobile() {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            width: 141,
            height: 191,
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
            height: 36,
            width: 141,
            onTap: () {},
            online: true,
            text: 'Upload',
            textStyle: TextStyle(fontSize: 14, color: Colors.white),

            // icon: SvgPicture.asset(
            //   'assets/svgs/upload.svg',
            //   height: 10,
            //   width: 10,
            // )
        )
      ],
    );
  }

  Widget buildCustomCheckbox({required String text}) {
    return Row(
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
