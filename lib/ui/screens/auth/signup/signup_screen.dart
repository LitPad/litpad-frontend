import 'package:litpad/core/utils/utils.dart';

import 'signup_desktop.dart';
import 'signup_mobile.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth >= 950
            ? const SignupDesktop()
            : const SignupMobile();
      },
    );
  }
}
