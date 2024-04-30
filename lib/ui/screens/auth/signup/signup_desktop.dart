import 'package:litpad/core/core.dart';
import 'package:litpad/ui/screens/auth/widgets/signup_form.dart';
import 'package:litpad/ui/screens/auth/widgets/social_auth_btn.dart';

class SignupDesktop extends StatelessWidget {
  const SignupDesktop({Key? key}) : super(key: key);

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
                    "Sign up on LitPad",
                    style: AppTypography.text24.copyWith(
                      color: AppColors.grey900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const YBox(10),
                  Text(
                    "Where writers thrive and readers discover meaningful content",
                    style: AppTypography.text16.copyWith(
                      color: AppColors.grey600,
                    ),
                  ),
                  const YBox(20),
                  Row(
                    children: [
                      Expanded(
                        child: SocialAuthBtn(
                          text: "Sign up with Facebook",
                          svg: AppSvgs.fb,
                          onTap: () {},
                        ),
                      ),
                      const XBox(14),
                      Expanded(
                        child: SocialAuthBtn(
                          text: "Sign up with Google",
                          svg: AppSvgs.google,
                          onTap: () {},
                        ),
                      )
                    ],
                  ),
                  const YBox(20),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: AppColors.grey200,
                        ),
                      ),
                      const XBox(20),
                      Text(
                        "or",
                        style: AppTypography.text16,
                      ),
                      const XBox(20),
                      const Expanded(
                        child: Divider(
                          color: AppColors.grey200,
                        ),
                      ),
                    ],
                  ),
                  const YBox(10),
                  const SignupForm(),
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
