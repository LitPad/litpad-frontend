import 'package:litpad/ui/components/components.dart';
import 'package:litpad/ui/screens/home/containers/footer_section.dart';
import 'package:litpad/ui/screens/profile/containers/containers.dart';

class WritersBenefitScreen extends StatelessWidget {
  const WritersBenefitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
            WritersBenefitSection(),
            SizedBox(height: 30),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
