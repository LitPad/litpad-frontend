import 'package:go_router/go_router.dart';
import 'package:litpad/core/vm/auth/reset_new_password_vm.dart';
import 'package:litpad/core/vm/auth/set_new_password_vm.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart';

import '../../../../core/core.dart';
import '../../../ui.dart';

class SetNewPasswordForm extends StatefulWidget {
  const SetNewPasswordForm({Key? key}) : super(key: key);

  @override
  State<SetNewPasswordForm> createState() => _SetNewPasswordFormState();
}

class _SetNewPasswordFormState extends State<SetNewPasswordForm> {
  String? token;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final uri = Uri.parse(window.location.href);
    final pathSegments = uri.pathSegments.takeWhile((value) => value != '');

    token = pathSegments.isNotEmpty ? pathSegments.last : null;
    debugPrint('token: $token');
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<SetNewPasswordVM>(builder: (context, newPassVM, _) {
      return Column(
        children: [
          CustomTextField(
            controller: newPassVM.newPasswordC,
            labelText: 'New password',
            showLabelHeader: true,
            isPassword: true,
            borderRadius: 50,
          ),
          CustomTextField(
            controller: newPassVM.confirmPasswordC,
            labelText: 'Confirm new password',
            showLabelHeader: true,
            isPassword: true,
            borderRadius: 50,
          ),
          const YBox(30),
          CustomBtn.solid(
            onTap: setNewPassword,
            online: true,
            text: 'Reset password',
          ),
          const YBox(16),
        ],
      );
    });
  }
  setNewPassword() async{
    printty("Login pressed");

    var setNewPassword = context.read<SetNewPasswordVM>().setNewPass(token).then((value) {
      if (value.success) {
        debugPrint('D $value');
        context.goNamed(RoutePath.authCheckMail);
      } else {
        debugPrint('Error');
        // show error toast
      }
    });

  }
}
