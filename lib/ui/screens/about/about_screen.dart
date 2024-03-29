import 'package:litpad/core/utils/constants/constants.dart';
import 'package:litpad/ui/components/home/navbar_widget.dart';
import 'package:litpad/ui/screens/about/containers/containers.dart';
import 'package:litpad/ui/screens/home/containers/containers.dart';

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
    return const Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          NavBar(),
          OurVisionScreen(),
          SizedBox(height: 30),
          MeetTheTeamScreen(),
          SizedBox(height: 80),
          FooterSection(),
        ],
      ),
    ));
  }
}
