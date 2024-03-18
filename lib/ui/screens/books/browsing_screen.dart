import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/home/navbar_widget.dart';
import 'package:litpad/ui/screens/books/containers/containers.dart';
import 'package:litpad/ui/screens/home/containers/containers.dart';

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
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NavBar(),
            const CategoryNameList(),
            const BooksByCategory(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
              child: const Divider(),
            ),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
