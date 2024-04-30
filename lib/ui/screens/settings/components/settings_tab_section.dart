import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:litpad/ui/screens/screens.dart';

class SettingsTabDesktop extends StatefulWidget {
  const SettingsTabDesktop({Key? key}) : super(key: key);

  @override
  State<SettingsTabDesktop> createState() => _SettingsTabDesktopState();
}

class _SettingsTabDesktopState extends State<SettingsTabDesktop> {
  int _selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const YBox(40),
          Text(
            "Settings",
            style: AppTypography.text32.copyWith(fontWeight: FontWeight.w500),
          ),
          const YBox(32),
          Container(
            height: 50,
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
                      text: 'Language',
                      isActive: _selectedTabIndex == 0,
                      onTap: () => setState(() => _selectedTabIndex = 0),
                    ),
                    MenuTab(
                      text: 'Notification',
                      isActive: _selectedTabIndex == 1,
                      onTap: () => setState(() => _selectedTabIndex = 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 550,
            child: Column(
              children: [
                Visibility(
                  visible: _selectedTabIndex == 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _selectedTabIndex == 0 ? 1 : 0,
                    child: const LanguageTab(),
                  ),
                ),
                Visibility(
                  visible: _selectedTabIndex == 1,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _selectedTabIndex == 1 ? 1 : 0,
                    child: const NotificationTab(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SettingsTabMobile extends StatefulWidget {
  const SettingsTabMobile({Key? key}) : super(key: key);

  @override
  State<SettingsTabMobile> createState() => _SettingsTabMobileState();
}

class _SettingsTabMobileState extends State<SettingsTabMobile> {
  int _selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const YBox(24),
          Text(
            "Settings",
            style: AppTypography.text20.copyWith(fontWeight: FontWeight.w500),
          ),
          const YBox(20),
          Container(
            height: 30,
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
                      isMobile: true,
                      text: 'Language',
                      isActive: _selectedTabIndex == 0,
                      onTap: () => setState(() => _selectedTabIndex = 0),
                    ),
                    MenuTab(
                      isMobile: true,
                      text: 'Notification',
                      isActive: _selectedTabIndex == 1,
                      onTap: () => setState(() => _selectedTabIndex = 1),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const YBox(24),
          SizedBox(
            width: 550,
            child: Column(
              children: [
                Visibility(
                  visible: _selectedTabIndex == 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _selectedTabIndex == 0 ? 1 : 0,
                    child: const LanguageTab(isMobile: true),
                  ),
                ),
                Visibility(
                  visible: _selectedTabIndex == 1,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _selectedTabIndex == 1 ? 1 : 0,
                    child: const NotificationTab(isMobile: true),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
