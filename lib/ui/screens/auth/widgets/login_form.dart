import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:litpad/ui/components/buttons/buttons.dart';
import 'package:litpad/ui/components/textfields/textfields.dart';
import 'package:provider/provider.dart';

import '../../../../core/core.dart';
import '../../../../core/service/toast_service.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final toast = ToastService();

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginVM>(builder: (context, loginVM, _) {
      return loginVM.isBusy
          ? const SpinKitFadingCircle(
              color: Colors.deepPurple,
              size: 50.0,
            )
          : Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                      controller: loginVM.emailC,
                      labelText: 'Email',
                      showLabelHeader: true,
                      borderRadius: 50,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      }),
                  const YBox(20),
                  CustomTextField(
                    controller: loginVM.passwordC,
                    labelText: 'Password',
                    showLabelHeader: true,
                    isPassword: true,
                    borderRadius: 50,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  const YBox(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          toast.show('Help');
                          // context.goNamed(RoutePath.unverifiedUserScreen);
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
                    text: 'Login',
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
              ),
            );
    });
  }

  completeLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      printty("Login pressed");
      context.read<LoginVM>().login().then((value) {
        debugPrint('Login Res $value');
        if (value.success) {
          debugPrint('D $value');
         context.pushReplacement('/home');

          // context.goNamed(RoutePath.homeScreen);
        }
        //Todo: Handle case for unverified accounts
        else if(value.code == 401) {
          context.goNamed(RoutePath.verifyMailScreen);
          debugPrint('Error on login');
          // show error toast
        }
      });
    } else {
      debugPrint('Form validation failed');
    }
  }
}

//Todo: write logic for when user is unverified.
