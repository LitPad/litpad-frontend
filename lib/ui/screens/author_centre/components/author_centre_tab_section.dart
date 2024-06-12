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

  Map<String, Widget> menuTabs = {
    'Homepage': const IncomeTab(),
    'Story': const StoryTab(),
    'Income': const InboxTab(),
    'Inbox': const InboxTab(),
    'Analytics': const HomepageTab(),
    'Gifts': const HomepageTab(),
    'My fans': const HomepageTab(),
  };

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
                  children: List.generate(
                    menuTabs.keys.length,
                    (index) => MenuTab(
                      text: menuTabs.keys.elementAt(index),
                      isActive: _selectedTabIndex == index,
                      onTap: () => setState(
                        () => _selectedTabIndex = index,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: List.generate(
              menuTabs.keys.length,
              (index) => Visibility(
                visible: _selectedTabIndex == index,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _selectedTabIndex == index ? 1 : 0,
                  child: menuTabs.values.elementAt(index),
                ),
              ),
            ),
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
  Map<String, Widget> menuTabs = {
    'Homepage': const HomepageTab(isMobile: true),
    'Story': const StoryTab(isMobile: true),
    'Income': const HomepageTab(isMobile: true),
    'Inbox': const HomepageTab(isMobile: true),
    'Analytics': const HomepageTab(isMobile: true),
    'Gifts': const HomepageTab(isMobile: true),
    'My fans': const HomepageTab(isMobile: true),
  };
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
                    children: List.generate(
                      menuTabs.keys.length,
                      (index) => MenuTab(
                        isMobile: true,
                        text: menuTabs.keys.elementAt(index),
                        isActive: _selectedTabIndex == index,
                        onTap: () => setState(
                          () => _selectedTabIndex = index,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: List.generate(
              menuTabs.keys.length,
              (index) => Visibility(
                visible: _selectedTabIndex == index,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: _selectedTabIndex == index ? 1 : 0,
                  child: menuTabs.values.elementAt(index),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
