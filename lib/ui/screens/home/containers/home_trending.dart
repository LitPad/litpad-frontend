import 'package:go_router/go_router.dart';
import 'package:litpad/core/router/app_router.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/books/books.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeTrending extends StatelessWidget {
  const HomeTrending({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => _mobileView(context),
      tablet: (BuildContext context) => _mobileView(context),
      desktop: (BuildContext context) => _desktopView(context),
    );
  }

  _mobileView(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      margin: const EdgeInsets.only(
        bottom: 20,
        top: 40,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Trending",
                  style: AppTypography.text20.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _textBtn(textSize: 14, iconSize: 18)
            ],
          ),
          const YBox(24),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 24,
            ),
            decoration: BoxDecoration(
              color: AppColors.grey100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (ctx, i) {
                  return Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: imageHelper(
                              AppImages.trendbook,
                              height: 185,
                              width: 127,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            width: 127,
                            decoration: BoxDecoration(
                              gradient: AppColors.trendBtn,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "1st",
                                  style: AppTypography.text14.copyWith(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          )
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
                                "Alluring aurora",
                                style: AppTypography.text16.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const YBox(4),
                              Text(
                                "By moria",
                                style: AppTypography.text14,
                              ),
                              const YBox(10),
                              Container(
                                padding: const EdgeInsets.only(right: 20),
                                child: Text(
                                  "Nobody is stupid enough to venture into unknown territories, except for Ilya. Don't get him",
                                  style: AppTypography.text14,
                                ),
                              ),
                              const SizedBox(height: 12),
                              const MobileTag()
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (ctx, _) => const YBox(24),
                itemCount: 3),
          ),
        ],
      ),
    );
  }

  Container _desktopView(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: (60),
        vertical: (54),
      ),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular books",
                style: AppTypography.text36.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              _textBtn()
            ],
          ),
          const YBox(40),
          Wrap(
            spacing: (20),
            runSpacing: (40),
            children: List.generate(6, (index) {
              return SizedBox(
                width: (420),
                child: BookCard(
                  imgWidth: 174,
                  imgheight: 225,
                  onImageTap: () {
                    context
                        .goNamed(RoutePath.bookDetailsScreen, pathParameters: {
                      'id': '1',
                    });
                  },
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  TextButton _textBtn({
    double? textSize,
    double? iconSize,
  }) {
    return TextButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "More",
            style: TextStyle(
              fontSize: textSize ?? 18,
              fontWeight: FontWeight.w500,
              color: AppColors.purple500,
            ),
          ),
          Icon(
            color: AppColors.purple500,
            Icons.chevron_right_outlined,
            size: iconSize ?? 30,
          )
        ],
      ),
    );
  }
}
