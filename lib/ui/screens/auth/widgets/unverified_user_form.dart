import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart';
import '../../../../core/core.dart';
import '../../../ui.dart';

class UnverifiedAccountForm extends StatefulWidget {
  const UnverifiedAccountForm({Key? key}) : super(key: key);

  @override
  State<UnverifiedAccountForm> createState() => _UnverifiedAccountFormState();
}

//Todo: Check for errors on this method
class _UnverifiedAccountFormState extends State<UnverifiedAccountForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ResendVerificationMailVM>(
        builder: (context, resendMailVM, _) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
                controller: resendMailVM.emailC,
                labelText: 'Email',
                showLabelHeader: true,
                borderRadius: 50,
                hintText: 'xxxxxx@gmail.com',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                }),
            const YBox(30),
            CustomBtn.solid(
              onTap: verifyAccount,
              online: true,
              text: 'Verify account',
            ),
            const YBox(16),
          ],
        ),
      );
    });
  }

  verifyAccount() async {
    printty("Login pressed");
    if (_formKey.currentState?.validate() ?? false) {
      context.read<ResendVerificationMailVM>().verifyMail().then((value) {
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
}
