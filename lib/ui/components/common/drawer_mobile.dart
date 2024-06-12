import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:litpad/core/core.dart';
import 'package:litpad/core/utils/themes/themes.dart';
import 'package:litpad/core/vm/profile/profile.dart';
import 'package:litpad/ui/components/common/common.dart';
import 'package:provider/provider.dart';

import '../../../core/models/user.dart';
import '../../../core/router/app_router.dart';
import '../buttons/custom_btn.dart';

//Todo: Build Drawer screen for mobile menubar
class DrawerMobile extends StatelessWidget {
  const DrawerMobile({
    super.key,
    required this.onNavItemTap,
  });
  final Function(int) onNavItemTap;
  @override
  Widget build(BuildContext context) {
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
              context.goNamed(RoutePath.writersBenefitScreen);
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
              // context.goNamed(RoutePath.writersBenefitScreen);
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
            onTap: () {
              // context.goNamed(RoutePath.writersBenefitScreen);
            },
            leading: svgHelper('assets/svgs/logout.svg'),
          ),
          const YBox(20),
        ],
      ),
    );
  }
}

class MyWalletItem extends StatelessWidget {
  const MyWalletItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(width: 1),
            right: BorderSide(width: 1),
            left: BorderSide(width: 1),
            bottom: BorderSide(width: 1),
          ),
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade100.withOpacity(0.2)),
      child: Column(
        children: [
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My wallet', style: AppTypography.text14Bold,),
              // XBox(50),
              Row(
                children: [
                  Text('View details',  style: AppTypography.text12,),
                  const Icon(Icons.keyboard_arrow_right)
                ],
              )
            ],
          ),
          const YBox(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              svgHelper('assets/svgs/coin.svg'),
              const Column(
                children: [
                  Text('0'),
                  Text('coins'),
                ],
              ),
              // XBox(50),
              Row(
                children: [
                  CustomBtn.solid(
                    height: 33,
                    borderRadius: 100,
                    onTap: () {
                      context.goNamed(RoutePath.signupScreen);
                    },
                    online: true,
                    text: 'Top up',
                    // width: 110,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class CoinsFree extends StatelessWidget {
  const CoinsFree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      decoration: BoxDecoration(
          border: const Border(
            top: BorderSide(width: 1, color: Color(0xff5A1F52)),
            right: BorderSide(width: 1, color: Color(0xff5A1F52)),
            left: BorderSide(width: 1, color: Color(0xff5A1F52)),
            bottom: BorderSide(width: 1, color: Color(0xff5A1F52)),
          ),
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffffe6fa)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '50 coins free for you!!!',
                style: AppTypography.text12,
              ),
              const Icon(
                Icons.close_sharp,
                size: 18,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 4, left: 4, right: 4),
                  margin: const EdgeInsets.only(bottom: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: const Border(
                        top: BorderSide(width: 1, color: Color(0xff5A1F52)),
                        right: BorderSide(width: 1, color: Color(0xff5A1F52)),
                        left: BorderSide(width: 1, color: Color(0xff5A1F52)),
                        bottom: BorderSide(width: 1, color: Color(0xff5A1F52)),
                      ),
                      borderRadius: BorderRadius.circular(100),
                      color: const Color(0x0fFFCDF5)),
                  child: Text(
                    'Limited Offer',
                    style: AppTypography.text12,
                  )),
              // XBox(50),
              Text(
                'Claim now',
                style: AppTypography.text12,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewUserProfileVM>(
      builder: (context, userProfileVM, _) {
        User? user = userProfileVM.user;
        debugPrint('User === $user');
        return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                child: Text('T'),
              ),
              const XBox(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(user?.firstName ??'Temitope', style: AppTypography.text16),
                  Row(
                    children: [
                      Text(
                        'ID ${user?.id ??'70999HIH'}' ,
                        style: AppTypography.text14,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: svgHelper(
                            'assets/svgs/copy1.svg',
                            height: 14.4,
                            width: 10.8,
                          )),
                    ],
                  )
                ],
              ),
            ],
          ),
          const Icon(Icons.keyboard_arrow_right, color: AppColors.grey),
        ]);
      }
    );
  }
}

class LandingPageDrawerMobile extends StatelessWidget {
  const LandingPageDrawerMobile({
    super.key,
    required this.onNavItemTap,
  });
  final Function(int) onNavItemTap;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.bgWhite,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.close),
            ),
          ),
          const  YBox(20),

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
              context.goNamed(RoutePath.writersBenefitScreen);
            },
            trailing: const Icon(Icons.keyboard_arrow_down_rounded,
                color: AppColors.grey),
          ),
       const  YBox(20),
          CustomBtn.outline(
            onlineColor: Colors.transparent,
            onTap: () {
              context.goNamed(RoutePath.loginScreen);
            },
            online: true,
            text: 'Login',
            // width: 110,
          ),
          const YBox(20),
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
