import 'dart:async';

import 'package:go_router/go_router.dart';
import 'package:litpad/core/core.dart';
import 'package:litpad/ui/components/buttons/buttons.dart';
import 'package:provider/provider.dart';

class ResetPasswordMessageScreen extends StatelessWidget {
  const ResetPasswordMessageScreen({Key? key}) : super(key: key);

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

class MainContent extends StatefulWidget {
  const MainContent({
    Key? key,
    this.width,
    this.isMobile = false,
  }) : super(key: key);

  final double? width;
  final bool isMobile;

  @override
  State<MainContent> createState() => _MainContentState();
}

class _MainContentState extends State<MainContent> {
  Timer? _timer;
  int _remainingSeconds = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }
  String getFormattedTime(int remainingSeconds) {
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}'; // Pad seconds with 0
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignupVM>(builder: (context, signupVM, _) {
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            svgHelper(
              AppSvgs.logoIcon,
            ),
            const YBox(20),
            Text(
              "Check your email",
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
                        "Please check your email for instructions on resetting your password ",
                    style: AppTypography.text15.copyWith(
                      color: AppColors.grey600,
                      fontFamily: "Inter",
                      height: 1.5,
                    ),
                  ),
                ])),
            const YBox(30),
            _remainingSeconds > 0
                ? Text(
                    'Send code again  ${getFormattedTime(_remainingSeconds)} seconds',
                    style: AppTypography.text15.copyWith(
                      color: AppColors.grey600,
                      fontFamily: "Inter",
                      height: 1.5,
                    ),
                  )
                : CustomBtn.solid(
                    onTap: () {
                      context.goNamed(RoutePath.forgotPasswordScreen);
                    },
                    online: true,
                    text: 'Resend link')
          ],
        ),
      );
    });
  }
}
