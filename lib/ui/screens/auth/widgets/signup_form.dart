import 'package:go_router/go_router.dart';
import 'package:litpad/core/router/app_router.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/buttons/buttons.dart';
import 'package:litpad/ui/components/textfields/textfields.dart';
import 'package:litpad/ui/screens/auth/signup/signup_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpScreenViewModel>.reactive(
      viewModelBuilder: () => SignUpScreenViewModel(),
      builder: (context, model, _) {
        return Column(
          children: [
            const CustomTextField(
              labelText: 'Email',
              showLabelHeader: true,
              borderRadius: 50,
            ),
            const YBox(20),
            const CustomTextField(
              labelText: 'Username',
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
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'By proceeding, you agree to  LitPad’s ',
                    style: AppTypography.text12.copyWith(
                      color: AppColors.grey600,
                      fontFamily: "Inter",
                    ),
                  ),
                  TextSpan(
                    text: 'Terms of Service',
                    style: AppTypography.text12.copyWith(
                      color: AppColors.grey900,
                      fontFamily: "Inter",
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: AppTypography.text12.copyWith(
                      color: AppColors.grey600,
                      fontFamily: "Inter",
                    ),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: AppTypography.text12.copyWith(
                      color: AppColors.grey900,
                      fontFamily: "Inter",
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ),
            const YBox(16),
            CustomBtn.solid(
              onTap: () {
                context.goNamed(RoutePath.authCheckMail);
              },
              online: true,
              text: 'Save changes',
            ),
            const YBox(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: AppTypography.text14.copyWith(
                    color: AppColors.grey600,
                  ),
                ),
                const XBox(5),
                InkWell(
                  onTap: () {
                    context.goNamed(RoutePath.loginScreen);
                  },
                  child: Text(
                    "Sign in",
                    style: AppTypography.text14.copyWith(
                      color: AppColors.grey900,
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
