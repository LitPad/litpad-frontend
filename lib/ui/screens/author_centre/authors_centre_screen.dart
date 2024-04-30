import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/ui.dart';

class AuthorsCentreScreen extends StatelessWidget {
  const AuthorsCentreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                constraints.maxWidth >= 950
                    ? const DeskTopNavbar()
                    : const MobileNavbar(),
                constraints.maxWidth >= 950
                    ? const AuthorCentreTabDesktop()
                    : const AuthorCentreTabMobile(),
                const HDivider(),
                const FooterSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}
