import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:litpad/core/core.dart';
import 'package:litpad/core/vm/auth/verify_email_vm.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart';

import '../../../components/components.dart';

class VerifyMailScreen extends StatefulWidget {
  String? token;
  VerifyMailScreen({this.token, super.key});

  @override
  State<VerifyMailScreen> createState() => _VerifyMailScreenState();
}

class _VerifyMailScreenState extends State<VerifyMailScreen> {
  String? token;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final uri = Uri.parse(window.location.href);
    final pathSegments = uri.pathSegments.takeWhile((value) => value != '');

    token = pathSegments.isNotEmpty ? pathSegments.last : null;
    debugPrint('token: $token');
  }

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
                  ? MainContent(
                      width: 570,
                      token: token,
                    )
                  : MainContent(token: token);
            }),
          ),
        ),
      );
    });
  }
}

class MainContent extends StatefulWidget {
  const MainContent({
    Key? key,
    this.width,
    this.isMobile = false,
    this.token,
  }) : super(key: key);

  final double? width;
  final bool isMobile;
  final String? token;

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VerifyMailVM>(builder: (context, verifyMailVM, _) {
      return Container(
        width: widget.width,
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
        child: verifyMailVM.isBusy
            ? const SpinKitFadingCircle(
                color: Colors.deepPurple,
                size: 50.0,
              )
            : (verifyMailVM.isSuccess == true)
                ? Column(
                    // Success UI
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      svgHelper(
                        AppSvgs.logoIcon,
                      ),
                      const YBox(20),
                      Text(
                        "Verification Successful!",
                        style: TextStyle(
                          fontSize: widget.isMobile ? 20 : 24,
                          color: AppColors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const YBox(30),
                      CustomBtn.solid(
                        onTap: () {
                          context.goNamed(RoutePath.loginScreen);
                        },
                        text: ' Login',
                        online: !verifyMailVM.isBusy,
                      ),
                    ],
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      svgHelper(
                        AppSvgs.logoIcon,
                      ),
                      const YBox(20),
                      Text(
                        "Kindly verify your mail",
                        style: TextStyle(
                          fontSize: widget.isMobile ? 20 : 24,
                          color: AppColors.grey900,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const YBox(30),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                              text:
                                  "Please click the button to authenticate your account ",
                              style: AppTypography.text15.copyWith(
                                color: AppColors.grey600,
                                fontFamily: "Inter",
                                height: 1.5,
                              ),
                            ),
                          ])),
                      const YBox(30),
                      CustomBtn.solid(
                        onTap: () async {
                          if (widget.token != null) {
                            await verifyMailVM.verifyMail(
                                token: widget.token ?? '');
                          }
                        },
                        online: !verifyMailVM.isBusy,
                        text: 'Authenticate account',
                      ),
                    ],
                  ),
      );
    });
  }
}
