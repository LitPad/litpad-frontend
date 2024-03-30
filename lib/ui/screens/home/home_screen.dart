import 'package:litpad/core/utils/utils.dart';
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
    // printty(w, logLevel: "width");
    // printty(h, logLevel: "height");
    return Scaffold(
        backgroundColor: AppColors.bgWhite,
        body: SingleChildScrollView(
          // controller: context.scrollController,
          child: Column(
            children: [
              const NavBar(),
              const HeroSection(),
              const WithLitpadSection(),
              const PopularBooks(),
              const HomeTrending(),
              const HomeRising(),
              const PopularBooks(title: "Serialising"),
              const PopularBooks(title: "Completed books"),
              const PopularBooks(title: "Upcoming books"),
              // const OurBookingListSection(), // NOT NEEDED FOR NOW
              // const JoinLitpadContainer(), // NOT NEEDED FOR NOW
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 60,
                  horizontal: 60,
                ),
                child: const Divider(),
              ),
              const FooterSection(),
            ],
          ),
        ));
  }
}
