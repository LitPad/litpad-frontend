import 'package:litpad/ui/screens/auth/widgets/forgot_password_form.dart';

import '../../../../core/core.dart';
import '../widgets/signup_form.dart';

class ForgotPasswordMobile extends StatelessWidget {
  const ForgotPasswordMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: (32),
              horizontal: (32),
            ),
            margin: const EdgeInsets.symmetric(
              vertical: (100),
              horizontal: (16),
            ),
            decoration: const BoxDecoration(
              color: AppColors.bgWhite,
              borderRadius: BorderRadius.all(Radius.circular(36)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey300,
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                svgHelper(
                  AppSvgs.logoIcon,
                ),
                const YBox(10),
                Text(
                  "Reset your password",
                  style: AppTypography.text20.copyWith(
                    color: AppColors.grey900,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const YBox(10),
                Text(
                  "Enter the email address associated with your account and we’ll send you a link to reset your password",
                  textAlign: TextAlign.center,
                  style: AppTypography.text14.copyWith(
                    color: AppColors.grey600,
                  ),
                ),
                const YBox(10),
                const ForgotPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
