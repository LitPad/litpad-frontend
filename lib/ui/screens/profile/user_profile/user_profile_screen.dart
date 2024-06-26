import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:litpad/ui/screens/profile/containers/avatar_container.dart';
import 'package:litpad/ui/screens/profile/widgets/profile_tab_menu_section.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
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
                  ? const AvatarContainerDeskTop()
                  : const AvatarContainerMobile(),
              constraints.maxWidth >= 950
                  ? const ProfileTabMenuSectionDeskTop()
                  : const ProfileTabMenuSectionMobile(),
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
