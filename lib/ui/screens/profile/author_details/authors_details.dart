import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/components.dart';
import 'package:litpad/ui/screens/profile/author_details/author_details_viewmodel.dart';
import 'package:litpad/ui/screens/profile/containers/avatar_container.dart';
import 'package:litpad/ui/screens/profile/containers/published_books.dart';
import 'package:stacked/stacked.dart';

class AuthorsDetails extends StatelessWidget {
  const AuthorsDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return ViewModelBuilder<AuthorDetailsViewModel>.reactive(
        viewModelBuilder: () => AuthorDetailsViewModel(),
        builder: (context, model, _) =>
            LayoutBuilder(builder: (context, constraints) {
              return Scaffold(
                backgroundColor: AppColors.white,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      constraints.maxWidth >= 768
                          ? const DeskTopNavbar()
                          : const MobileNavbar(),
                      const SizedBox(height: 30),
                      const AvatarContainer(),
                      const PublishedBooks(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40, horizontal: 60),
                        child: const Divider(
                          color: AppColors.grey300,
                        ),
                      ),
                      const FooterSection(),
                    ],
                  ),
                ),
              );
            }));
  }
}
