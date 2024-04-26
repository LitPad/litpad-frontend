import 'package:litpad/core/core.dart';
import 'package:litpad/ui/components/buttons/custom_btn.dart';
import 'package:litpad/ui/components/textfields/custom_textfield.dart';

class UpdateProfileWidget extends StatelessWidget {
  const UpdateProfileWidget({Key? key, this.isMobile = false})
      : super(key: key);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("Update your details",
            style: AppTypography.text22.copyWith(
              fontWeight: FontWeight.w500,
            )),
        YBox(isMobile ? 20 : 50),
        const CustomTextField(
          labelText: 'Username',
          showLabelHeader: true,
          hintText: 'teeboy',
          borderRadius: 50,
        ),
        YBox(isMobile ? 20 : 50),
        const CustomTextField(
          labelText: 'Email',
          showLabelHeader: true,
          hintText: 'topboy@gmail.com',
          borderRadius: 50,
        ),
        YBox(isMobile ? 20 : 50),
        CustomBtn.solid(
          onTap: () {},
          online: true,
          text: 'Save changes',
          width: 170,
        )
      ],
    );
  }
}
