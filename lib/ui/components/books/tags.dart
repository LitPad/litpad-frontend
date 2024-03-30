import 'package:litpad/core/utils/utils.dart';

class Tags extends StatelessWidget {
  const Tags({
    Key? key,
    this.onTap,
    required this.tag,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: AppColors.grey200,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Text(
          tag,
          style: AppTypography.text13.copyWith(
            color: AppColors.grey600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class MobileTag extends StatelessWidget {
  const MobileTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey300,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        "Romance",
        style: AppTypography.text10.copyWith(
          color: AppColors.black600,
        ),
      ),
    );
  }
}
