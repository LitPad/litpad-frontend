import 'package:litpad/ui/components/components.dart';
import 'package:litpad/ui/screens/profile/containers/containers.dart';

class WritersBenefitScreen extends StatelessWidget {
  const WritersBenefitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              constraints.maxWidth >= 768
                  ? const DeskTopNavbar()
                  : const MobileNavbar(),
              const WritersBenefitSection(),
              const SizedBox(height: 30),
              const FooterSection(),
            ],
          ),
        ),
      );
    });
  }
}
