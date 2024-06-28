import 'package:litpad/core/core.dart';

class RangeCard extends StatelessWidget {
  const RangeCard({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      width: 176,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        border: Border.fromBorderSide(
          BorderSide(
            color: AppColors.grey300,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: AppTypography.text15,
          ),
          const Icon(
            Icons.arrow_drop_down,
            size: 20,
          ),
        ],
      ),
    );
  }
}
