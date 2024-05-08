import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:litpad/core/vm/auth/set_new_password_vm.dart';
import 'package:provider/provider.dart';

import '../../../../core/core.dart';
import '../../../components/buttons/custom_btn.dart';
import '../widgets/new_password_form.dart';

class SetNewPasswordMobile extends StatefulWidget {
  const SetNewPasswordMobile({Key? key}) : super(key: key);

  @override
  State<SetNewPasswordMobile> createState() => _SetNewPasswordMobileState();
}

class _SetNewPasswordMobileState extends State<SetNewPasswordMobile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SetNewPasswordVM>(builder: (context, setNewPassVM, _) {
      return Scaffold(
        body: Container(
          color: AppColors.white,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: setNewPassVM.isBusy
              ? const SpinKitFadingCircle(
                  color: Colors.deepPurple,
                  size: 50.0,
                )
              : setNewPassVM.isSuccess != true
                  ? SingleChildScrollView(
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
                            const YBox(20),
                            const SetNewPasswordForm(),
                          ],
                        ),
                      ),
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
                          "Password reset successful!",
                          style: TextStyle(
                            fontSize: 20,
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
        ),
      );
    });
  }
}
