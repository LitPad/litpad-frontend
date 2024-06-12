import 'package:go_router/go_router.dart';
import 'package:litpad/core/core.dart';
import 'package:litpad/ui/screens/auth/widgets/widgets.dart';
import 'package:provider/provider.dart';

//Todo: Check Google and Facebook login methods if they function properly
class LoginMobile extends StatefulWidget {
  const LoginMobile({Key? key}) : super(key: key);

  @override
  State<LoginMobile> createState() => _LoginMobileState();
}

class _LoginMobileState extends State<LoginMobile> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FaceBookLoginVM>(
          create: (context) => FaceBookLoginVM(),
        ),
        ChangeNotifierProvider<GoogleLoginVM>(
          create: (context) => GoogleLoginVM(),
        ),
      ],
      child: Scaffold(
        body: Container(
          color: AppColors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
              child: Container(
            width: (600),
            padding: const EdgeInsets.symmetric(
              vertical: (32),
              horizontal: (32),
            ),
            margin: const EdgeInsets.symmetric(
              vertical: (60),
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
                  "Welcome Back",
                  style: AppTypography.text24.copyWith(
                    color: AppColors.grey900,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const YBox(30),
                Row(
                  children: [
                    Expanded(
                      child: SocialAuthBtn(
                        isMobile: true,
                        text: "Facebook",
                        svg: AppSvgs.fb,
                        onTap: () =>
                            context.read<FaceBookLoginVM>().facebookLogin(),
                      ),
                    ),
                    const XBox(14),
                    Expanded(
                      child: SocialAuthBtn(
                        isMobile: true,
                        text: "Google",
                        svg: AppSvgs.google,
                        onTap: googleLogin,
                      ),
                    )
                  ],
                ),
                const YBox(30),
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
                const YBox(20),
                const LoginForm(),
              ],
            ),
          )),
        ),
      ),
    );
  }

  googleLogin() {
    printty("Login pressed");

    context.read<GoogleLoginVM>().googleLogin().then((value) {
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
