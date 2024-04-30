import 'package:litpad/core/core.dart';
import 'package:litpad/ui/components/textfields/custom_textfield.dart';

class LanguageTab extends StatelessWidget {
  const LanguageTab({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        YBox(isMobile ? 20 : 40),
        CustomTextField(
          height: isMobile ? 44 : 48,
          hintText: 'English',
          showSuffixIcon: true,
          suffixIcon: const Icon(
            Icons.expand_more,
            color: AppColors.grey400,
          ),
          borderRadius: 50,
        ),
      ],
    );
  }
}
