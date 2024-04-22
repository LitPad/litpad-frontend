import 'package:litpad/core/core.dart';
import 'package:litpad/ui/components/components.dart';

class CreateUsernameScreen extends StatelessWidget {
  const CreateUsernameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Container(
            color: AppColors.white,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Builder(builder: (context) {
                return constraints.maxWidth >= 950
                    ? _mainContent(width: 600)
                    : _mainContent(isMobile: true);
              }),
            ),
          ),
        );
      },
    );
  }

  Widget _mainContent({bool isMobile = false, double? width}) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(
        vertical: (32),
        horizontal: (32),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
          Text(
            "Create a username",
            style: AppTypography.text24.copyWith(
              color: AppColors.grey900,
              fontWeight: FontWeight.w600,
            ),
          ),
          const YBox(20),
          const CustomTextField(
            labelText: 'Username',
            showLabelHeader: true,
            borderRadius: 50,
          ),
          const YBox(20),
          CustomBtn.solid(
            onTap: () {
              // context.goNamed(RoutePath.homeScreen);
            },
            online: true,
            text: 'Continue',
          ),
        ],
      ),
    );
  }
}
