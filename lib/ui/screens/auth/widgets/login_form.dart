import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:litpad/core/router/app_router.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/buttons/buttons.dart';
import 'package:litpad/ui/components/textfields/textfields.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(
          labelText: 'Email',
          showLabelHeader: true,
          borderRadius: 50,
        ),
        const YBox(20),
        const CustomTextField(
          labelText: 'Password',
          showLabelHeader: true,
          isPassword: true,
          borderRadius: 50,
        ),
        const YBox(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                // context.goNamed(RoutePath.forgotPasswordScreen);
              },
              child: Text(
                "Forgot password?",
                style: AppTypography.text14.copyWith(
                  color: AppColors.grey900,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const YBox(30),
        CustomBtn.solid(
          onTap: () {
            // context.goNamed(RoutePath.homeScreen);
          },
          online: true,
          text: 'Save changes',
        ),
        const YBox(16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You are new here? ",
              style: AppTypography.text14.copyWith(
                color: AppColors.grey600,
              ),
            ),
            const XBox(5),
            InkWell(
              onTap: () {
                context.goNamed(RoutePath.signupScreen);
              },
              child: Text(
                "Create an account",
                style: AppTypography.text14.copyWith(
                  color: AppColors.grey900,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
