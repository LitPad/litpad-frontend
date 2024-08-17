import 'package:litpad/core/core.dart';

import '../../../../components/buttons/custom_btn.dart';
import '../../../../components/common/on_hover.dart';

class CustomHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBack;
  final VoidCallback onPublish;
  final VoidCallback onPreview;

  const CustomHeader({super.key,
    required this.title,
    required this.onBack,
    required this.onPublish,
    required this.onPreview,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = MediaQuery.of(context).size.width > 600;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            OnHoverTranslate(
              child: InkWell(
                onTap: onPublish,
                child: Container(
                  width: isDesktop ? 112 : 81,
                  height: isDesktop ? 47 : 33,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.primaryPurple),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Publish',
                          style: TextStyle(
                              fontSize: isDesktop ? 16 : 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const XBox(10),
            OnHoverTranslate(
              child: InkWell(
                onTap: onPreview,
                child: Container(
                  width: isDesktop ? 112 : 81,
                  height: isDesktop ? 47 : 33,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color:  AppColors.black,
                        width: 1,
                      ),
                      color: AppColors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Preview',
                          style: TextStyle(
                              fontSize: isDesktop ? 16 : 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
