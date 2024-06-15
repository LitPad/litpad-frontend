import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:litpad/ui/screens/screens.dart';

class AuthorCentreTabDesktop extends StatefulWidget {
  const AuthorCentreTabDesktop({Key? key}) : super(key: key);

  @override
  State<AuthorCentreTabDesktop> createState() => _AuthorCentreTabDesktopState();
}

class _AuthorCentreTabDesktopState extends State<AuthorCentreTabDesktop> {
  int _selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const YBox(20),
          Row(
            children: [
              Text(
                "Author centre",
                style:
                    AppTypography.text24.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const YBox(36),
          Container(
            height: 50,
            margin: const EdgeInsets.only(bottom: 40),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.grey300,
                  width: 1,
                ),
              ),
            ),
            child: Stack(
              children: [
                Row(
                  children: [
                    MenuTab(
                      text: 'Homepage',
                      fontSize: 18,
                      isActive: _selectedTabIndex == 0,
                      onTap: () => setState(() => _selectedTabIndex = 0),
                    ),
                    MenuTab(
                      text: 'Story',
                      fontSize: 18,
                      isActive: _selectedTabIndex == 1,
                      onTap: () => setState(() => _selectedTabIndex = 1),
                    ),
                    MenuTab(
                      text: 'Income',
                      fontSize: 18,
                      isActive: _selectedTabIndex == 2,
                      onTap: () => setState(() => _selectedTabIndex = 2),
                    ),
                    MenuTab(
                      text: 'Inbox',
                      fontSize: 18,
                      isActive: _selectedTabIndex == 2,
                      onTap: () => setState(() => _selectedTabIndex = 2),
                    ),
                    MenuTab(
                      text: 'Analytics',
                      fontSize: 18,
                      isActive: _selectedTabIndex == 3,
                      onTap: () => setState(() => _selectedTabIndex = 3),
                    ),
                    MenuTab(
                      text: 'Gifts',
                      fontSize: 18,
                      isActive: _selectedTabIndex == 4,
                      onTap: () => setState(() => _selectedTabIndex = 4),
                    ),
                    MenuTab(
                      text: 'My fans',
                      fontSize: 18,
                      isActive: _selectedTabIndex == 5,
                      onTap: () => setState(() => _selectedTabIndex = 5),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Visibility(
                visible: _selectedTabIndex == 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _selectedTabIndex == 0 ? 1 : 0,
                  child: const HomepageTab(),
                ),
              ),
              Visibility(
                visible: _selectedTabIndex == 1,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _selectedTabIndex == 1 ? 1 : 0,
                  child: const UpdatePasswordWidget(),
                ),
              ),
              Visibility(
                visible: _selectedTabIndex == 2,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _selectedTabIndex == 2 ? 1 : 0,
                  child: const FollowingTab(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AuthorCentreTabMobile extends StatefulWidget {
  const AuthorCentreTabMobile({Key? key}) : super(key: key);

  @override
  State<AuthorCentreTabMobile> createState() => _AuthorCentreTabMobileState();
}

class _AuthorCentreTabMobileState extends State<AuthorCentreTabMobile> {
  int _selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const YBox(20),
          Row(
            children: [
              Text(
                "Author centre",
                style:
                    AppTypography.text24.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const YBox(36),
          Container(
            height: 30,
            margin: const EdgeInsets.only(bottom: 40),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.grey300,
                  width: 1,
                ),
              ),
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      MenuTab(
                        isMobile: true,
                        text: 'Homepage',
                        isActive: _selectedTabIndex == 0,
                        onTap: () => setState(() => _selectedTabIndex = 0),
                      ),
                      MenuTab(
                        isMobile: true,
                        text: 'Story',
                        isActive: _selectedTabIndex == 1,
                        onTap: () => setState(() => _selectedTabIndex = 1),
                      ),
                      MenuTab(
                        isMobile: true,
                        text: 'Income',
                        isActive: _selectedTabIndex == 2,
                        onTap: () => setState(() => _selectedTabIndex = 2),
                      ),
                      MenuTab(
                        isMobile: true,
                        text: 'Inbox',
                        isActive: _selectedTabIndex == 2,
                        onTap: () => setState(() => _selectedTabIndex = 2),
                      ),
                      MenuTab(
                        isMobile: true,
                        text: 'Analytics',
                        isActive: _selectedTabIndex == 2,
                        onTap: () => setState(() => _selectedTabIndex = 2),
                      ),
                      MenuTab(
                        isMobile: true,
                        text: 'Gifts',
                        isActive: _selectedTabIndex == 2,
                        onTap: () => setState(() => _selectedTabIndex = 2),
                      ),
                      MenuTab(
                        isMobile: true,
                        text: 'My fans',
                        isActive: _selectedTabIndex == 2,
                        onTap: () => setState(() => _selectedTabIndex = 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Visibility(
                visible: _selectedTabIndex == 0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _selectedTabIndex == 0 ? 1 : 0,
                  child: const HomepageTab(isMobile: true),
                ),
              ),
              Visibility(
                visible: _selectedTabIndex == 1,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _selectedTabIndex == 1 ? 1 : 0,
                  child: const UpdatePasswordWidget(),
                ),
              ),
              Visibility(
                visible: _selectedTabIndex == 2,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _selectedTabIndex == 2 ? 1 : 0,
                  child: const FollowingTab(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
