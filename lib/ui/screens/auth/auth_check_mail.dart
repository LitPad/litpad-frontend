import 'package:iconsax/iconsax.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/components.dart';

class AuthCheckMail extends StatelessWidget {
  const AuthCheckMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.white,
        width: Sizer.screenWidth,
        height: Sizer.screenHeight,
        child: Center(
            child: Container(
          width: Sizer.width(570),
          padding: EdgeInsets.symmetric(
            vertical: Sizer.height(32),
            horizontal: Sizer.width(50),
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
                style: AppTypography.text24.copyWith(
                  color: AppColors.grey900,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const YBox(30),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                      text: "We’ve sent you secure login link to",
                      style: AppTypography.text15.copyWith(
                        color: AppColors.grey600,
                        fontFamily: "Inter",
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text: " isabella@gmail.com, ",
                      style: AppTypography.text15.copyWith(
                        color: AppColors.grey900,
                        fontFamily: "Inter",
                        height: 1.5,
                      ),
                    ),
                    TextSpan(
                      text:
                          "Please click the link to authenticate your account",
                      style: AppTypography.text15.copyWith(
                        color: AppColors.grey600,
                        fontFamily: "Inter",
                        height: 1.5,
                      ),
                    ),
                  ])),
              const YBox(30),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: Sizer.height(10),
                  horizontal: Sizer.width(18),
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
                    Text(
                      "isabella@gmail.com",
                      style: AppTypography.text14.copyWith(
                        color: AppColors.grey700,
                      ),
                    ),
                    const XBox(12),
                    Icon(
                      Iconsax.edit_2,
                      size: Sizer.radius(20),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
