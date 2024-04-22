import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/screens/auth/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth >= 950
            ? const LoginDesktop()
            : const LoginMobile();
      },
    );
  }
}
