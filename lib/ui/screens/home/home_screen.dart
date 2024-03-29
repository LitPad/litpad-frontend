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
              const YBox(100),
              const HeroSection(),
              const YBox(80),
              const WithLitpadSection(),
              const PopularBooks(),
              const OurBookingListSection(),
              const JoinLitpadContainer(),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: Sizer.height(60),
                  horizontal: Sizer.width(60),
                ),
                child: const Divider(),
              ),
              const FooterSection(),
            ],
          ),
        ));
  }
}
