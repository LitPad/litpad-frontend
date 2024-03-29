import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/components.dart';

class SocialAuthBtn extends StatelessWidget {
  const SocialAuthBtn({
    Key? key,
    required this.text,
    this.onTap,
    required this.svg,
  }) : super(key: key);

  final String text;
  final VoidCallback? onTap;
  final String svg;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Sizer.height(50),
        padding: EdgeInsets.symmetric(
          horizontal: Sizer.width(20),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.grey200,
          ),
        ),
        child: Row(
          children: [
            svgHelper(svg, height: 28, width: 28),
            const XBox(10),
            Text(
              text,
              style: AppTypography.text15.copyWith(
                color: AppColors.grey600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
