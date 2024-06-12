import 'package:litpad/core/core.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:litpad/ui/screens/screens.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              constraints.maxWidth >= 950
                  ? const DeskTopNavbar()
                  : const MobileNavbar(),
              constraints.maxWidth >= 950
                  ? const SettingsTabDesktop()
                  : const SettingsTabMobile(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
                child: const Divider(
                  color: AppColors.grey300,
                ),
              ),
              const FooterSection(),
            ],
          ),
        ),
      );
    });
  }
}
