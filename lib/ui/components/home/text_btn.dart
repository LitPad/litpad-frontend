import 'package:litpad/core/core.dart';

class TextBtn extends StatelessWidget {
  final double? textSize;
  final double? iconSize;

  const TextBtn({super.key, this.textSize, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "More",
            style: TextStyle(
              fontSize: textSize ?? 18,
              fontWeight: FontWeight.w500,
              color: AppColors.purple500,
            ),
          ),
          Icon(
            Icons.chevron_right_outlined,
            color: AppColors.purple500,
            size: iconSize ?? 30,
          )
        ],
      ),
    );
  }
}
