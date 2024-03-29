import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/home/navbar_widget.dart';
import 'package:litpad/ui/screens/books/containers/containers.dart';
import 'package:litpad/ui/screens/home/containers/containers.dart';

class LatestBooksScreen extends StatefulWidget {
  const LatestBooksScreen({Key? key}) : super(key: key);

  @override
  State<LatestBooksScreen> createState() => _LatestBooksScreenState();
}

class _LatestBooksScreenState extends State<LatestBooksScreen> {
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
            const SizedBox(height: 30),
            const BooksByCategory(),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
              child: const Divider(
                color: AppColors.grey300,
                thickness: 1,
              ),
            ),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
