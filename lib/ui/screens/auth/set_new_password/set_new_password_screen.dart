import 'package:litpad/ui/screens/auth/set_new_password/set_new_password.dart';

import '../../../../core/utils/utils.dart';

class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth >= 950
            ? const SetNewPasswordDesktop()
            : const SetNewPasswordMobile();
      },
    );
  }
}
