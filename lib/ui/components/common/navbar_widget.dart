import 'package:go_router/go_router.dart';
import 'package:litpad/core/router/app_router.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/components.dart';

class MobileNavbar extends StatelessWidget {
  const MobileNavbar({
    Key? key,
    this.openDrawer,
  }) : super(key: key);

  final VoidCallback? openDrawer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavLogo(
            logoWidth: 105,
            logoHeight: 28,
          ),
          Row(
            children: [
              svgHelper(AppSvgs.search,
                  height: 24, width: 24, color: AppColors.black),
              const XBox(20),
              InkWell(
                onTap: openDrawer,
                child: const Icon(Icons.menu),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DeskTopNavbar extends StatelessWidget {
  const DeskTopNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
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
      // height: 83,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const NavLogo(),
              const XBox(50),
              Row(
                children: [
                  NavButton(
                    text: 'Browse',
                    onTap: () {
                      context.goNamed(RoutePath.browsingScreen);
                    },
                  ),
                  NavButton(
                      text: 'Book listing',
                      onTap: () {
                        context.goNamed(RoutePath.latestBooksScreen);
                      }),
                  NavButton(
                    text: 'Settings',
                    onTap: () {
                      context.goNamed(RoutePath.settingsScreen);
                    },
                  ),
                  NavButton(
                    text: 'TopUp',
                    onTap: () {
                      // context.goNamed(RoutePath.topupScreen);
                    },
                  ),
                  NavButton(
                    text: 'Author\'s Centre',
                    onTap: () {
                      context.goNamed(RoutePath.authorCentreScreen);
                    },
                  ),
                  NavButton(
                    text: 'Author Id',
                    onTap: () {
                      context.goNamed(RoutePath.authorsDetailScreen,
                          pathParameters: {
                            'id': '1',
                          });
                    },
                  ),
                  NavButton(
                    text: 'My Profile',
                    onTap: () {
                      context.goNamed(RoutePath.profileScreen, pathParameters: {
                        'id': '1',
                      });
                    },
                  ),
                  // NavButton(
                  //   text: 'About Us',
                  //   onTap: () {
                  //     context.goNamed(RoutePath.aboutScreen);
                  //   },
                  // ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              NavButton(
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
                // width: 110,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  const NavButton({super.key, required this.text, this.onTap});

  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return OnHoverTranslate(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
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
}

class NavLogo extends StatelessWidget {
  const NavLogo({
    super.key,
    this.logoWidth,
    this.logoHeight,
  });

  final double? logoWidth;
  final double? logoHeight;

  @override
  Widget build(BuildContext context) {
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
            width: logoWidth,
            height: logoHeight,
          ),
        ),
      ),
    );
  }
}
