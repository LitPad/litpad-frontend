
import 'package:go_router/go_router.dart';
import 'package:litpad/ui/components/buttons/buttons.dart';
import 'package:litpad/ui/components/textfields/textfields.dart';
import 'package:provider/provider.dart';

import '../../../../core/core.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Consumer<LoginVM>(
      builder: (context, loginVM,_) {
        return Column(
          children: [
             CustomTextField(
              controller: loginVM.emailC,
              labelText: 'Email',
              showLabelHeader: true,
              borderRadius: 50,
            ),
            const YBox(20),
             CustomTextField(controller: loginVM.passwordC,
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
                    context.goNamed(RoutePath.forgotPasswordScreen);
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
              onTap: completeLogin,
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
    );
  }

  completeLogin() {
    printty("Login pressed");

    var loginVm = context.read<LoginVM>().login().then((value) {
      if (value.success) {
        debugPrint('D $value');
        context.goNamed(RoutePath.homeScreen);
      } else {
        debugPrint('Error');
        // show error toast
      }
    });

  }
}
