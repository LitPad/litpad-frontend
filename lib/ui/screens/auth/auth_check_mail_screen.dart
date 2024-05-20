import 'package:litpad/core/core.dart';
import 'package:provider/provider.dart';

class AuthCheckMailScreen extends StatelessWidget {
  const AuthCheckMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          color: AppColors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Builder(builder: (context) {
              return constraints.maxWidth >= 950
                  ? const MainContent(width: 570)
                  : const MainContent();
            }),
          ),
        ),
      );
    });
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
    this.width,
    this.isMobile = false,
  }) : super(key: key);

  final double? width;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final resendMail =
        Provider.of<ResendVerificationMailVM>(context, listen: false);

    return Consumer<SignupVM>(builder: (context, signupVM, _) {
      return Container(
        width: width,
        padding: const EdgeInsets.symmetric(
          vertical: (32),
          horizontal: (50),
        ),
        margin: const EdgeInsets.symmetric(
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
            const YBox(20),
            Text(
              "Check your inbox",
              style: TextStyle(
                fontSize: isMobile ? 20 : 24,
                color: AppColors.grey900,
                fontWeight: FontWeight.w600,
              ),
            ),
            const YBox(30),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: "We’ve sent you secure login link to ",
                    style: AppTypography.text15.copyWith(
                      color: AppColors.grey600,
                      fontFamily: "Inter",
                      height: 1.5,
                    ),
                  ),
                  signupVM.emailC.text.isEmpty
                      ? TextSpan(
                          text: resendMail.emailC.text,
                          style: AppTypography.text15.copyWith(
                            color: AppColors.grey900,
                            fontFamily: "Inter",
                            height: 1.5,
                          ),
                        )
                      : TextSpan(
                          text: signupVM.emailC.text,
                          style: AppTypography.text15.copyWith(
                            color: AppColors.grey900,
                            fontFamily: "Inter",
                            height: 1.5,
                          ),
                        ),
                  TextSpan(
                    text:
                        " Please click the link to authenticate your account ",
                    style: AppTypography.text15.copyWith(
                      color: AppColors.grey600,
                      fontFamily: "Inter",
                      height: 1.5,
                    ),
                  ),
                ])),
            const YBox(30),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: (10),
                horizontal: (18),
              ),
              decoration: BoxDecoration(
                color: AppColors.grey100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.grey300,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  signupVM.emailC.text.isEmpty
                      ? Text(
                          resendMail.emailC.text,
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 15,
                            color: AppColors.grey700,
                          ),
                        )
                      : Text(
                          signupVM.emailC.text,
                          style: TextStyle(
                            fontSize: isMobile ? 14 : 15,
                            color: AppColors.grey700,
                          ),
                        ),
                  const XBox(12),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
