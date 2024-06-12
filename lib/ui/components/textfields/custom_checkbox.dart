import 'package:litpad/core/utils/utils.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    Key? key,
    this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  final VoidCallback? onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 1000),
        width: 18,
        height: 18,
        // padding: EdgeInsets.all(2.w),
        decoration: BoxDecoration(
            color: AppColors.white,
            border: isSelected
                ? null
                : Border.all(
                    color: AppColors.grey,
                    width: 2,
                  ),
            borderRadius: BorderRadius.circular(2)),
        child: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
              color: isSelected ? AppColors.red : Colors.transparent,
              borderRadius: BorderRadius.circular(2)),
          child: const Icon(Icons.check, size: 16, color: AppColors.white),
        ),
      ),
    );
  }
}
