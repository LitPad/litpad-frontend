import 'package:go_router/go_router.dart';
import 'package:litpad/core/core.dart';
import 'package:litpad/ui/ui.dart';

class HomepageTab extends StatelessWidget {
  const HomepageTab({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMobile)
          Row(
            children: [
              const StoryCard(),
              const XBox(40),
              Expanded(
                flex: 2,
                child: _dateCard(),
              )
            ],
          ),
        if (isMobile) const StoryCard(),
        if (isMobile) const YBox(20),
        if (isMobile) _dateCard(),
        const YBox(50),
        Container(
          height: 360,
          width: 584,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.grey300,
                      width: 1,
                    ),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      "Events",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey900,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: imageHelper(AppImages.prize),
              ),
            ],
          ),
        ),
        const YBox(130),
      ],
    );
  }

  Container _dateCard() {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }


}

class StoryCard extends StatefulWidget {
  const StoryCard({Key? key}) : super(key: key);

  @override
  _StoryCardState createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.grey300,
                  width: 1,
                ),
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Stories",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grey900),
                ),
                Text(
                  "view all stories",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.purple600,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                imageHelper(AppImages.book, height: 80, width: 102),
                const YBox(30),
                const Text(
                  "You have no stories yet",
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.grey600,
                  ),
                ),
                const YBox(16),
                BtnContainer(
                  onTap: (){
                    context.goNamed(RoutePath.createStoryScreen);
                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 14,
                  ),
                  text: "Create story",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

