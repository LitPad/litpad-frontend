import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:litpad/ui/components/buttons/custom_btn.dart';
import 'package:provider/provider.dart';

import '../../../../core/core.dart';
import '../widgets/new_password_form.dart';

class SetNewPasswordDesktop extends StatefulWidget {
  const SetNewPasswordDesktop({Key? key}) : super(key: key);

  @override
  State<SetNewPasswordDesktop> createState() => _SetNewPasswordDesktopState();
}

class _SetNewPasswordDesktopState extends State<SetNewPasswordDesktop> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SetNewPasswordVM>(builder: (context, setNewPassVM, _) {
      return Scaffold(
        body: setNewPassVM.isBusy
            ? const SpinKitFadingCircle(
                color: Colors.deepPurple,
                size: 50.0,
              )
            : setNewPassVM.isSuccess != true
                ? ListView(
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
                              const YBox(20),
                              const SetNewPasswordForm(),
                            ],
                          ),
                        ),
                      ),
                      const YBox(60),
                    ],
                  )
                : Column(
                    // Success UI
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      svgHelper(
                        AppSvgs.logoIcon,
                      ),
                      const YBox(20),
                      const Text(
                        "Password reset Successful!",
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColors.green,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const YBox(30),
                      CustomBtn.solid(
                        onTap: () {
                          context.goNamed(RoutePath.loginScreen);
                        },
                        text: 'Login',
                        online: !setNewPassVM.isBusy,
                      ),
                    ],
                  ),
      );
    });
  }
}
