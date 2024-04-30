import 'package:litpad/core/core.dart';

class BtnContainer extends StatelessWidget {
  const BtnContainer({
    Key? key,
    required this.text,
    this.fontSize,
    this.padding,
    this.onTap,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 6,
            ),
        decoration: BoxDecoration(
          color: AppColors.purple400,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.white,
            fontSize: fontSize ?? 16,
          ),
        ),
      ),
    );
  }
}
