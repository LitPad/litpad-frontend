import 'package:go_router/go_router.dart';
import 'package:litpad/core/router/app_router.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => mobileNavBar(context),
      tablet: (BuildContext context) => deeskTopNavBar(context),
      desktop: (BuildContext context) => deeskTopNavBar(context),
    );
  }
}

Widget mobileNavBar(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.menu),
        navLogo(context),
      ],
    ),
  );
}

Widget deeskTopNavBar(BuildContext context) {
  return Container(
    padding: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 60,
    ),
    decoration: const BoxDecoration(
      color: AppColors.white,
      border: Border(
        bottom: BorderSide(
          color: AppColors.grey300,
          width: 1,
        ),
      ),
    ),
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            navLogo(context),
            const XBox(50),
            Row(
              children: [
                navButton(
                  text: 'Browse',
                  onTap: () {
                    context.goNamed(RoutePath.browsingingScreen);
                  },
                ),
                navButton(
                    text: 'Book listing',
                    onTap: () {
                      context.goNamed(RoutePath.latestBooksScreen);
                    }),
                navButton(
                  text: 'About Us',
                  onTap: () {
                    context.goNamed(RoutePath.aboutScreen);
                  },
                ),
                navButton(text: 'Pricing'),
                navButton(text: 'Feedback')
              ],
            ),
          ],
        ),
        Row(
          children: [
            navButton(
                text: 'Login',
                onTap: () {
                  context.goNamed(RoutePath.loginScreen);
                }),
            CustomBtn.solid(
              onTap: () {
                context.goNamed(RoutePath.signupScreen);
              },
              online: true,
              text: 'Sign up',
              width: 110,
            )
          ],
        ),
      ],
    ),
  );
}

Widget navButton({required String text, VoidCallback? onTap}) {
  return OnHoverTranslate(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: AppTypography.text15,
        ),
      ),
    ),
  );
}

Widget navLogo(BuildContext context) {
  return OnHoverScale(
    child: InkWell(
      onTap: () {
        context.goNamed(RoutePath.homeScreen);
      },
      hoverColor: AppColors.transparent,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: svgHelper(
          AppSvgs.logo,
        ),
      ),
    ),
  );
}
