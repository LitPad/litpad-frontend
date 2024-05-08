import 'package:litpad/core/core.dart';
import 'package:litpad/ui/screens/auth/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SignupMobile extends StatelessWidget {
  const SignupMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FaceBookLoginVM>(
      builder: (context, faceBookVM, _) {
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
                      "Sign up on LitPad",
                      style: AppTypography.text20.copyWith(
                        color: AppColors.grey900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const YBox(10),
                    Text(
                      "Where writers thrive and readers discover meaningful content",
                      textAlign: TextAlign.center,
                      style: AppTypography.text14.copyWith(
                        color: AppColors.grey600,
                      ),
                    ),
                    const YBox(20),
                    Row(
                      children: [
                        Expanded(
                          child: SocialAuthBtn(
                            isMobile: true,
                            text: "Facebook",
                            svg: AppSvgs.fb,
                            onTap: faceBookVM.facebookLogin,
                          ),
                        ),
                        const XBox(14),
                        Expanded(
                          child: SocialAuthBtn(
                            isMobile: true,
                            text: "Google",
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
          ),
        );
      }
    );
  }
}
