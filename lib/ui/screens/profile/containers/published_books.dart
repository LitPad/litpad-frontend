import 'package:flutter/material.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/screens/profile/widgets/widgets.dart';

class PublishedBooks extends StatefulWidget {
  const PublishedBooks({Key? key}) : super(key: key);

  @override
  State<PublishedBooks> createState() => _PublishedBooksState();
}

class _PublishedBooksState extends State<PublishedBooks> {
  int _selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
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

class MenuTab extends StatelessWidget {
  const MenuTab({
    Key? key,
    required this.text,
    this.onTap,
    this.isActive = false,
  }) : super(key: key);

  final String text;
  final Function()? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500), // Animation duration
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isActive ? AppColors.purple900 : AppColors.grey300,
              width: isActive ? 2 : 1,
            ),
          ),
        ),
        child: Text(
          text,
          style: AppTypography.text22.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
