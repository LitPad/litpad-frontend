
import '../../../../core/utils/utils.dart';
import 'forgot_password.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth >= 950
            ? const ForgotPasswordDesktop()
            : const ForgotPasswordMobile();
      },
    );  }
}
