import '../../../../core/core.dart';
import '../widgets/forgot_password_form.dart';

class ForgotPasswordDesktop extends StatelessWidget {
  const ForgotPasswordDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const YBox(60),
          Container(
            alignment: Alignment.center,
            color: AppColors.white,
            // width: MediaQuery.of(context).size.width,
            // height: MediaQuery.of(context).size.height,
            child: Container(
              width: (600),
              padding: const EdgeInsets.symmetric(
                vertical: (32),
                horizontal: (32),
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
                    style: AppTypography.text24.copyWith(
                      color: AppColors.grey900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const YBox(10),
                  Text(
                    "Enter the email address associated with your account and we’ll send you a link to reset your password",
                    style: AppTypography.text16.copyWith(
                      color: AppColors.grey600,
                    ),
                  ),
                  const YBox(20),
                  const ForgotPasswordForm(),
                ],
              ),
            ),
          ),
          const YBox(60),
        ],
      ),
    );
  }
}
