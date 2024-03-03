import 'package:flutter/material.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/common/on_hover.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => mobileNavBar(),
      tablet: (BuildContext context) => deeskTopNavBar(),
      desktop: (BuildContext context) => deeskTopNavBar(),
    );
  }
}

Widget mobileNavBar() {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 20),
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.menu),
        navLogo(),
      ],
    ),
  );
}

Widget deeskTopNavBar() {
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 60,
    ),
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            navLogo(),
            const XBox(50),
            Row(
              children: [
                navButton('Features'),
                navButton('About Us'),
                navButton('Pricing'),
                navButton('Feedback')
              ],
            ),
          ],
        ),
        Row(
          children: [
            navButton('Login'),
            CustomBtn.solid(
              onTap: () {},
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

Widget navButton(String text) {
  return OnHoverTranslate(
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: AppTypography.text15,
        ),
      ),
    ),
  );
}

Widget navLogo() {
  return OnHoverScale(
    child: InkWell(
      onTap: () {},
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
