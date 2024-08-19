import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart' as html;
import '../../../../core/core.dart';
import '../../../ui.dart';

class SetNewPasswordForm extends StatefulWidget {
  const SetNewPasswordForm({Key? key}) : super(key: key);

  @override
  State<SetNewPasswordForm> createState() => _SetNewPasswordFormState();
}

//Todo: Check for errors on this method
class _SetNewPasswordFormState extends State<SetNewPasswordForm> {
  String? token;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final uri = Uri.parse(html.window.location.href);
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

  setNewPassword() async {
    printty("Login pressed");
    context.read<SetNewPasswordVM>().setNewPass(token).then((value) {
      if (value.success) {
        debugPrint('D $value');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.green,
            duration: const Duration(seconds: 2),
            content: Text(
              value.message ?? 'Successful',
              textAlign: TextAlign.center,
            ),
          ),
        );
        context.goNamed(RoutePath.authCheckMail);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.red,
            duration: const Duration(seconds: 2),
            content: Text(
              value.message ?? 'Try again',
              textAlign: TextAlign.center,
            ),
          ),
        ); // show error toast
      }
    });
  }
}
