import 'package:flutter/material.dart';
import 'package:litpad/ui/components/buttons/custom_btn.dart';
import 'package:litpad/ui/components/textfields/custom_textfield.dart';

class UpdateProfileWidget extends StatelessWidget {
  const UpdateProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomTextField(
          labelText: 'Username',
          showLabelHeader: true,
          hintText: 'teeboy',
          borderRadius: 50,
        ),
        const SizedBox(height: 50),
        const CustomTextField(
          labelText: 'Email',
          showLabelHeader: true,
          hintText: 'topboy@gmail.com',
          borderRadius: 50,
        ),
        const SizedBox(height: 50),
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
