import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/common/on_hover.dart';
import 'package:litpad/ui/components/home/home.dart';

class OurBookingListSection extends StatefulWidget {
  const OurBookingListSection({Key? key}) : super(key: key);

  @override
  State<OurBookingListSection> createState() => _OurBookingListSectionState();
}

class _OurBookingListSectionState extends State<OurBookingListSection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        vertical: 60,
        horizontal: 60,
      ),
      decoration: BoxDecoration(
        color: AppColors.purple100,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Our Book listing",
            style: AppTypography.text40.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 32),
          Container(
            width: w,
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TabBtn(
                      isSelected: selectedIndex == 0,
                      text: "Latest books",
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                    ),
                    const XBox(30),
                    TabBtn(
                      isSelected: selectedIndex == 1,
                      text: "Upcoming books",
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                    const XBox(30),
                    TabBtn(
                      isSelected: selectedIndex == 2,
                      text: "Top-rated books",
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 40,
                  ),
                  child: const Divider(),
                ),
                Wrap(
                  spacing: 10,
                  children: [
                    for (var i = 0; i < 10; i++) const ArticleCard(),
                  ],
                ),
                const YBox(40),
                Container(
                  alignment: Alignment.center,
                  child: const TabBtn(
                    isSelected: true,
                    activeColor: AppColors.grey200,
                    text: "View more",
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TabBtn extends StatelessWidget {
  const TabBtn({
    Key? key,
    this.isSelected = false,
    required this.text,
    this.activeColor,
    this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final String text;
  final Color? activeColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return OnHoverTranslate(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: isSelected
                ? (activeColor ?? AppColors.purple100)
                : AppColors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              color: isSelected
                  ? AppColors.purple800
                  : AppColors.black.withOpacity(0.20),
              width: 1,
            ),
          ),
          child: Text(
            text,
            style: AppTypography.text15.copyWith(
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.purple900 : AppColors.grey500,
            ),
          ),
        ),
      ),
    );
  }
}
