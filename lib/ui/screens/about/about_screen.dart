import 'package:litpad/core/utils/constants/constants.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:litpad/ui/screens/about/about_screen_viewmodel.dart';
import 'package:litpad/ui/screens/about/containers/containers.dart';
import 'package:stacked/stacked.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return ViewModelBuilder<AboutScreenViewModel>.nonReactive(viewModelBuilder: () => AboutScreenViewModel(), builder: (context, model, _) {
      return LayoutBuilder(builder: (context, constraints) {
        return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  constraints.maxWidth >= 768
                      ? const DeskTopNavbar()
                      : const MobileNavbar(),
                  const OurVisionScreen(),
                  const SizedBox(height: 30),
                  const MeetTheTeamScreen(),
                  const SizedBox(height: 80),
                  const FooterSection(),
                ],
              ),
            ));
      });
    });
  }
}
