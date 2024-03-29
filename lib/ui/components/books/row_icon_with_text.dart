import 'package:litpad/core/utils/utils.dart';

class RowIconWithText extends StatelessWidget {
  const RowIconWithText({
    Key? key,
    required this.text,
    required this.icon,
    this.color,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: color ?? AppColors.purple900,
          size: Sizer.radius(22),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppTypography.text14,
        ),
      ],
    );
  }
}
