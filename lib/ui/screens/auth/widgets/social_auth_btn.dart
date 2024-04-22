import 'package:litpad/core/utils/utils.dart';

class SocialAuthBtn extends StatelessWidget {
  const SocialAuthBtn({
    Key? key,
    required this.text,
    this.onTap,
    required this.svg,
    this.isMobile = false,
  }) : super(key: key);

  final String text;
  final VoidCallback? onTap;
  final String svg;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.grey200,
          ),
        ),
        child: Row(
          children: [
            svgHelper(
              svg,
              height: isMobile ? 24 : 28,
              width: isMobile ? 24 : 28,
            ),
            const XBox(10),
            Text(
              text,
              style: TextStyle(
                fontSize: isMobile ? 12 : 14,
                color: AppColors.grey600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
