import 'package:litpad/ui/components/components.dart';
import 'package:litpad/ui/screens/profile/containers/containers.dart';
import 'package:litpad/ui/screens/profile/writers_benefit/writers_benefit_screen_viewmodel.dart';
import 'package:stacked/stacked.dart';

class WritersBenefitScreen extends StatelessWidget {
  const WritersBenefitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WritersBenefitScreenViewModel>.reactive(
        viewModelBuilder: () => WritersBenefitScreenViewModel(),
        builder: (context, model, _) {
          return LayoutBuilder(builder: (context, constraints) {
            return Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    constraints.maxWidth >= 768
                        ? const DeskTopNavbar()
                        : const MobileNavbar(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: WritersBenefitSection(
                        constraints: constraints,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const FooterSection(),
                  ],
                ),
              ),
            );
          });
        });
  }
}
