import 'package:flutter/material.dart';
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
          style: AppTypography.text15.copyWith(
            color: AppColors.grey600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
