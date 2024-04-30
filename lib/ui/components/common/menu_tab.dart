import 'package:litpad/core/utils/utils.dart';

class MenuTab extends StatelessWidget {
  const MenuTab({
    Key? key,
    required this.text,
    this.onTap,
    this.isActive = false,
    this.isMobile = false,
    this.fontSize,
  }) : super(key: key);

  final String text;
  final Function()? onTap;
  final bool isActive;
  final bool isMobile;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: AppColors.transparent,
      highlightColor: AppColors.transparent,
      hoverColor: AppColors.transparent,
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
          style: TextStyle(
            fontSize: fontSize ?? (isMobile ? 14 : 22),
            fontWeight: FontWeight.w500,
            color: isActive ? AppColors.purple900 : AppColors.menuGrey,
          ),
        ),
      ),
    );
  }
}
