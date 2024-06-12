import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../core/core.dart';
import '../../../ui.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ResetPasswordVM>(builder: (context, resetVM, _) {
      return Column(
        children: [
          const YBox(20),
          CustomTextField(
            controller: resetVM.emailC,
            labelText: 'Email',
            hintText: 'xxxxxx@gmail.com',
            showLabelHeader: true,
            borderRadius: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    context.goNamed(RoutePath.loginScreen);
                  },
                  child: Text(
                    "Return to sign in",
                    style: AppTypography.text14.copyWith(
                        color: AppColors.grey900, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
          const YBox(30),
          CustomBtn.solid(
            onTap: resetPassword,
            online: true,
            text: 'Reset password',
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
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          )
        ],
      );
    });
  }

  resetPassword() {
    printty("Login pressed");
    context.read<ResetPasswordVM>().resetPassword().then((value) {
      if (value.success) {
        debugPrint('D $value');
        context.goNamed(RoutePath.resetPasswordMessageScreen);
      } else {
        debugPrint('Error');
        // show error toast
      }
    });
  }
}
