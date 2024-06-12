import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:litpad/ui/screens/books/containers/containers.dart';

class BrowsingScreen extends StatefulWidget {
  const BrowsingScreen({Key? key}) : super(key: key);

  @override
  State<BrowsingScreen> createState() => _BrowsingScreenState();
}

class _BrowsingScreenState extends State<BrowsingScreen> {
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
              constraints.maxWidth >= 768
                  ? const DeskTopNavbar()
                  : const MobileNavbar(),
              const CategoryNameList(),
              const BooksByCategory(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
                child: const Divider(),
              ),
              const FooterSection(),
            ],
          ),
        ),
      );
    });
  }
}
