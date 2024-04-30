import 'package:litpad/core/core.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Container(
        width: 34,
        height: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: widget.value ? AppColors.primaryPurple : Colors.grey,
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.ease,
              left: widget.value ? 16 : 1,
              child: Container(
                padding: const EdgeInsets.all(2),
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
