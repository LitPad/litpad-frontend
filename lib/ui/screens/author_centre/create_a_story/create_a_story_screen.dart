import 'package:litpad/ui/screens/author_centre/create_a_story/create_a_story.dart';

import '../../../../core/core.dart';
import '../../../components/common/footer_section.dart';

class CreateStoryScreen extends StatelessWidget {
  const CreateStoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return  constraints.maxWidth >= 950
              ? const CreateStoryDesktop()
              : const CreateStoryMobile();
      },
    );
  }
}
