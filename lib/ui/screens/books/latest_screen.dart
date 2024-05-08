import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:litpad/ui/screens/books/containers/containers.dart';

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
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              constraints.maxWidth >= 950
                  ? const DeskTopNavbar()
                  : const MobileNavbar(),
              const SizedBox(height: 30),
              const BooksByCategory(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
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
    });
  }
}
