import 'package:litpad/core/core.dart';
import 'package:litpad/ui/components/books/books.dart';
import 'package:litpad/ui/components/books/row_icon_with_text.dart';

class HomeRisingSibarSection extends StatelessWidget {
  const HomeRisingSibarSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      // margin: const EdgeInsets.only(
      //   bottom: 20,
      //   top: 40,
      // ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Rising",
              style: AppTypography.text20.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const YBox(24),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 24,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: AppColors.grey300,
              ),
            ),
            child: const SidebarList(),
          ),
        ],
      ),
    );
  }
}

class SidebarList extends StatelessWidget {
  const SidebarList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (ctx, i) {
        return Row(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    gradient: AppColors.trendBtn,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "1",
                      style: AppTypography.text14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                const XBox(16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: imageHelper(
                    AppImages.risingBook,
                    height: 130,
                    width: 96,
                  ),
                ),
              ],
            ),
            const XBox(16),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Whispering flame",
                      style: AppTypography.text16.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const YBox(4),
                    Text(
                      "By moria",
                      style: AppTypography.text14,
                    ),
                    const YBox(12),
                    const RowIconWithText(
                      text: "4.5k",
                      textSize: 12,
                      iconSize: 16,
                      icon: Icons.visibility_outlined,
                    ),
                    const YBox(12),
                    const MobileTag()
                  ],
                ),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (ctx, _) => const YBox(24),
      itemCount: 5,
    );
  }
}
