import 'package:litpad/core/utils/constants/constants.dart';
import 'package:litpad/ui/components/home/navbar_widget.dart';
import 'package:litpad/ui/screens/home/containers/containers.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      // controller: context.scrollController,
      child: Column(
        children: [
          const NavBar(),
          const SizedBox(height: 100),
          const HeroSection(),
          const SizedBox(height: 80),
          const WithLitpadSection(),
          const OurBookingListSection(),
          const JoinLitpadContainer(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 60),
            child: const Divider(),
          ),
          const FooterSection(),
        ],
      ),
    ));
  }
}
