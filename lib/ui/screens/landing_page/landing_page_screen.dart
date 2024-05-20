import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:litpad/ui/screens/home/containers/containers.dart';
import 'package:litpad/ui/screens/home/home_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key,}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    // printty(w, logLevel: "width");
    // printty(h, logLevel: "height");
    return ViewModelBuilder<HomeScreenViewModel>.reactive(
        viewModelBuilder: () => HomeScreenViewModel(),
        builder: (context, model, _) {
          return LayoutBuilder(builder: (context, constraints) {
            return Scaffold(
                key: scaffoldKey,
                backgroundColor: AppColors.bgWhite,
                endDrawer: constraints.maxWidth >= 950
                    ? null
                    : LandingPageDrawerMobile(onNavItemTap: (int navIndex) {
                        scaffoldKey.currentState?.closeEndDrawer();
                      }),
                body: SingleChildScrollView(
                  // controller: context.scrollController,
                  child: Column(
                    children: [
                      constraints.maxWidth >= 950
                          ?  const LandingPageNavBar()
                          : MobileNavbar(
                              openDrawer: () {
                                scaffoldKey.currentState!.openEndDrawer();
                              },
                            ),
                      constraints.maxWidth >= 950
                          ? const HeroSectionDestop()
                          : const HeroSectionMobile(),
                      constraints.maxWidth >= 950
                          ? const WithLitpadDesktop()
                          : const WithLitpadMobile(),
                      constraints.maxWidth >= 950
                          ? const PopularBookDesttop()
                          : const PopularBooksMobile(),
                      constraints.maxWidth >= 950
                          ? const HomeTrendingDesktop()
                          : const HometrendingMobile(),
                      const ArticleSlider(title: "New arrivals"),
                      constraints.maxWidth >= 950
                          ? const PopularBookDesttop(title: "Serialising")
                          : const PopularBooksMobile(title: "Serialising"),
                      constraints.maxWidth >= 950
                          ? const PopularBookDesttop(title: "Completed books")
                          : const PopularBooksMobile(title: "Completed books"),
                      const ArticleSlider(title: "Upcoming book"),
                      const HDivider(),
                      const FooterSection(),
                    ],
                  ),
                ));
          });
        });
  }
}
