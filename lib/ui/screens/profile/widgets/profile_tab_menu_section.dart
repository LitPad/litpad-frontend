import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/components.dart';

import 'update_password_widget.dart';
import 'update_profile_widget.dart';

class ProfileTabMenuSection extends StatefulWidget {
  const ProfileTabMenuSection({Key? key}) : super(key: key);

  @override
  State<ProfileTabMenuSection> createState() => _ProfileTabMenuSectionState();
}

class _ProfileTabMenuSectionState extends State<ProfileTabMenuSection> {
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
                      text: 'Profile',
                      isActive: _selectedTabIndex == 0,
                      onTap: () => setState(() => _selectedTabIndex = 0),
                    ),
                    MenuTab(
                      text: 'Password',
                      isActive: _selectedTabIndex == 1,
                      onTap: () => setState(() => _selectedTabIndex = 1),
                    ),
                    MenuTab(
                      text: 'Followings',
                      isActive: _selectedTabIndex == 2,
                      onTap: () => setState(() => _selectedTabIndex = 2),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 550,
            child: Column(
              children: [
                Visibility(
                  visible: _selectedTabIndex == 0,
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _selectedTabIndex == 0 ? 1 : 0,
                    child: const UpdateProfileWidget(),
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
              ],
            ),
          )
        ],
      ),
    );
  }
}
