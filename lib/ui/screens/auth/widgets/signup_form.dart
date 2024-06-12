import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:litpad/core/router/app_router.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/buttons/buttons.dart';
import 'package:litpad/ui/components/textfields/textfields.dart';
import 'package:provider/provider.dart';
import '../../../../core/vm/auth/signup_vm.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupVM>(
      builder: (context, signUpVM, _) {
        return signUpVM.isBusy ? const SpinKitFadingCircle(
          color: Colors.deepPurple,
          size: 50.0,
        ):
          Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                  controller: signUpVM.emailC,
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
                  controller: signUpVM.firstNameC,
                  labelText: 'First Name',
                  showLabelHeader: true,
                  borderRadius: 50,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  }),
              const YBox(20),
              CustomTextField(
                  controller: signUpVM.lastNameC,
                  labelText: 'Last Name',
                  showLabelHeader: true,
                  borderRadius: 50,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  }),
              const YBox(20),
              CustomTextField(
                  controller: signUpVM.userNameC,
                  labelText: 'Username',
                  showLabelHeader: true,
                  borderRadius: 50,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  }),
              const YBox(20),
              CustomTextField(
                controller: signUpVM.passwordC,
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
                  _completeSignUp();
                },
                online: !signUpVM.isBusy,
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
          ),
        );
      },
    );
  }

  _completeSignUp() {
    printty("Signup pressed");

    if (_formKey.currentState?.validate() ?? false) {
      context.read<SignupVM>().signUp().then((value) {
        if (value.success) {
          // show a success toast and navigate to next screen
          context.goNamed(RoutePath.authCheckMail);
        } else {
          debugPrint('Error');
        }
      });
    } else {
      debugPrint('Form validation failed');
    }
  }
}
