import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/core/vm/home/home.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:litpad/ui/screens/home/containers/containers.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  final bool? isAuthenticated;
  const HomeScreen({Key? key, this.isAuthenticated}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final vm = context.read<SiteHealthCheckVM>();
      final siteDetails = context.read<GetSiteDetailsVM>();

      final response = await siteDetails.getSiteDetails();
      printty(response, logLevel: 'Health Check');

      if (response.success) {
        printty("Site health check successful!");
      } else {
        printty("Site health check failed: ${response.message}");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    // printty(w, logLevel: "width");
    // printty(h, logLevel: "height");
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          key: scaffoldKey,
          backgroundColor: AppColors.bgWhite,
          endDrawer: constraints.maxWidth >= 950
              ? DrawerDesktop(onNavItemTap: (int navIndex) {
            scaffoldKey.currentState?.closeEndDrawer();})
              : DrawerMobile(onNavItemTap: (int navIndex) {
                  scaffoldKey.currentState?.closeEndDrawer();
                }),
          body: SingleChildScrollView(
            // controller: context.scrollController,
            child: Column(
              children: [
                constraints.maxWidth >= 950
                    ?  DeskTopNavbar(
                  openDrawer: () {
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                )
                    : MobileNavbar(
                        openDrawer: () {
                          scaffoldKey.currentState!.openEndDrawer();
                        },
                      ),
                constraints.maxWidth >= 950
                    ? const HeroSectionDestop()
                    : const HeroSectionMobile(),
                // constraints.maxWidth >= 950
                //     ? const WithLitpadDesktop()
                //     : const WithLitpadMobile(),
                constraints.maxWidth >= 950
                    ? const PopularBookDesktop()
                    :  PopularBooksMobile(),
                constraints.maxWidth >= 950
                    ?  HomeTrendingDesktop()
                    :  HomeTrendingMobile(),
                 ArticleSlider(title: "New arrivals"),
                constraints.maxWidth >= 950
                    ? const PopularBookDesktop(title: "Serialising")
                    :  PopularBooksMobile(title: "Serialising"),
                constraints.maxWidth >= 950
                    ? const PopularBookDesktop(title: "Completed books")
                    :  PopularBooksMobile(title: "Completed books"),
                 ArticleSlider(title: "Upcoming book"),
                const HDivider(),
                const FooterSection(),
              ],
            ),
          ));
    });
  }
}
