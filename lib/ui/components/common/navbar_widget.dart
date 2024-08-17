import 'package:go_router/go_router.dart';
import 'package:litpad/core/core.dart';
import 'package:litpad/core/router/app_router.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/core/vm/auth/logout_vm.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:provider/provider.dart';

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
  const DeskTopNavbar({
    this.openDrawer,
    super.key,
  });
  final VoidCallback? openDrawer;

  @override
  Widget build(BuildContext context) {
    final user = context.read<LoginVM>().user;
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
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
          const NavLogo(),
          const XBox(5),
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
                text: 'Writers benefit',
                onTap: () {
                  context.goNamed(RoutePath.writersBenefitScreen);
                },
              ),
              // NavButton(
              //   text: 'TopUp',
              //   onTap: () {
              //     // context.goNamed(RoutePath.topupScreen);
              //   },
              // ),
              NavButton(
                text: 'Author\'s Centre',
                onTap: () {
                  context.goNamed(RoutePath.authorCentreScreen);
                },
              ),
              // NavButton(
              //   text: 'Author Id',
              //   onTap: () {
              //     context.goNamed(RoutePath.authorsDetailScreen,
              //         pathParameters: {
              //           'id': '1',
              //         });
              //   },
              // ),

              // isAuthenticated == true ?
              // : const SizedBox() ,
              // NavButton(
              //   text: 'About Us',
              //   onTap: () {
              //     context.goNamed(RoutePath.aboutScreen);
              //   },
              // ),
            ],
          ),
          const XBox(20),
          Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: const CustomTextField(
                    borderRadius: 50,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'What do you want to read?',
                  )),
              const XBox(20),
              InkWell(
                onTap: () {},
                child: svgHelper('assets/svgs/notification.svg'),
              ),
              const XBox(20),
              GestureDetector(
                onTap: openDrawer,
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.purple100,
                        child: Text(user?.firstName[0] ?? '')),
                    const Icon(Icons.keyboard_arrow_down_rounded,
                        color: AppColors.grey),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class LandingPageNavBar extends StatelessWidget {
  // final bool? isAuthenticated;
  const LandingPageNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
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
          const NavLogo(),
          const XBox(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                text: 'Writer\'s benefit',
                onTap: () {
                  context.goNamed(RoutePath.writersBenefitScreen);
                },
              ),
            ],
          ),
          const XBox(30),
          const SizedBox(
              width: 264,
              child: CustomTextField(
                borderRadius: 50,
                prefixIcon: Icon(Icons.search),
                hintText: 'What do you want to read?',
              )),
          NavButton(
              text: 'Login',
              onTap: () {
                context.goNamed(RoutePath.loginScreen);
              }),
          // : const SizedBox(),
          CustomBtn.solid(
            onTap: () {
              context.goNamed(RoutePath.signupScreen);
            },
            online: true,
            text: 'Sign up',
            // width: 110,
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

class DrawerDesktop extends StatelessWidget {
  const DrawerDesktop({
    super.key,
    required this.onNavItemTap,
  });
  final Function(int) onNavItemTap;
  @override
  Widget build(BuildContext context) {
    return Consumer<LogoutVM>(
      builder: (context, logout, _) {
        return Drawer(
          backgroundColor: AppColors.bgWhite,
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              const UserDetails(),
              const YBox(10),
              const MyWalletItem(),
              const YBox(20),
              const CoinsFree(),
              const YBox(10),
              ListTile(
                leading: Text(
                  'Browse',
                  style: AppTypography.text15,
                ),
                onTap: () {
                  context.goNamed(RoutePath.browsingScreen);
                },
                trailing: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppColors.grey,
                ),
              ),
              ListTile(
                leading: Text(
                  'Book listing',
                  style: AppTypography.text15,
                ),
                onTap: () {
                  context.goNamed(RoutePath.latestBooksScreen);
                },
                trailing: const Icon(Icons.keyboard_arrow_down_rounded,
                    color: AppColors.grey),
              ),
              ListTile(
                leading: Text(
                  'Writer\'s benefit',
                  style: AppTypography.text15,
                ),
                onTap: () {
                  context.pushNamed(RoutePath.writersBenefitScreen);
                },
                trailing: const Icon(Icons.keyboard_arrow_down_rounded,
                    color: AppColors.grey),
              ),
              ListTile(
                title: Text(
                  'Library',
                  style: AppTypography.text15,
                ),
                onTap: () {
                  // context.goNamed(RoutePath.writersBenefitScreen);
                },
                leading: svgHelper('assets/svgs/bookmark.svg'),
              ),
              ListTile(
                title: Text(
                  'Author centre',
                  style: AppTypography.text15,
                ),
                onTap: () {
                  context.goNamed(RoutePath.authorCentreScreen);
                },
                leading: svgHelper('assets/svgs/write.svg'),
              ),
              ListTile(
                title: Text(
                  'Settings',
                  style: AppTypography.text15,
                ),
                onTap: () {
                  // context.goNamed(RoutePath.writersBenefitScreen);
                },
                leading: svgHelper('assets/svgs/settings.svg'),
              ),
              ListTile(
                title: Text(
                  'Support',
                  style: AppTypography.text15,
                ),
                onTap: () {
                  // context.goNamed(RoutePath.writersBenefitScreen);
                },
                leading: svgHelper('assets/svgs/support.svg'),
              ),
              ListTile(
                title: Text(
                  'Log out',
                  style: AppTypography.text15,
                ),
                onTap: () async {
                  var logoutResponse = await context.read<LogoutVM>().logout();
                  debugPrint('Logout val -------- $logoutResponse');
                  if (logoutResponse.success) {
                    context.goNamed(RoutePath.landingPage);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: const Duration(seconds: 2),
                        backgroundColor: AppColors.red,
                        content: Text(
                          logoutResponse.message ?? 'Something went wrong',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                leading: svgHelper('assets/svgs/logout.svg'),
              ),
              const YBox(20),
            ],
          ),
        );
      }
    );
  }
}
