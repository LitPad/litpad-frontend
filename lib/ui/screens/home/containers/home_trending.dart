import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/books/books.dart';
import 'package:litpad/ui/components/components.dart';

import 'home_rising_sidebar.dart';

class HomeTrendingDesktop extends StatelessWidget {
  const HomeTrendingDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: (60),
        vertical: (54),
      ),
      decoration: BoxDecoration(
        // color: AppColors.grey100,
        color: AppColors.bgWhite,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending books",
                      style: AppTypography.text36.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const TextBtn()
                  ],
                ),
                const YBox(40),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 50,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: CardImageWithBtn(
                              cardImageHeight: 251,
                              cardImageWidth: 218,
                              btnHeight: 42,
                              btnWidth: 230,
                            ),
                          ),
                          Expanded(
                            child: CardImageWithBtn(
                              cardImageHeight: 370,
                              cardImageWidth: 280,
                              btnHeight: 42,
                              btnWidth: 292,
                            ),
                          ),
                          Expanded(
                            child: CardImageWithBtn(
                              cardImageHeight: 251,
                              cardImageWidth: 218,
                              btnHeight: 42,
                              btnWidth: 230,
                            ),
                          ),
                        ],
                      ),
                      YBox(40),
                      Row(
                        children: [
                          Expanded(child: CardDetailSMobile()),
                          Expanded(child: CardDetailSMobile()),
                          Expanded(child: CardDetailSMobile()),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Expanded(
            flex: 2,
            child: HomeRisingSibarSection(),
          )
        ],
      ),
    );
  }
}

class CardDetailSMobile extends StatelessWidget {
  const CardDetailSMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 50,
      ),
      child: Column(
        children: [
          Text(
            "An affair with a notorious heiress",
            textAlign: TextAlign.center,
            style: AppTypography.text20.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const YBox(8),
          Text(
            "By moria",
            style: AppTypography.text16,
          ),
          const YBox(16),
          const MobileTag(),
          const YBox(20),
          Container(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              "Nobody is stupid enough to venture into unknown territories, except for Ilya. Don't get him",
              textAlign: TextAlign.center,
              style: AppTypography.text14,
            ),
          ),
        ],
      ),
    );
  }
}

class HometrendingMobile extends StatelessWidget {
  const HometrendingMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
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
                  const TextBtn(textSize: 14, iconSize: 18)
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
                        const CardImageWithBtn(),
                        const XBox(16),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: const CardDetails(),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (ctx, _) => const YBox(24),
                  itemCount: 3,
                ),
              ),
              const YBox(40),
            ],
          ),
        ),
        const HomeRisingSibarSection()
      ],
    );
  }
}

class CardDetails extends StatelessWidget {
  const CardDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
            style: AppTypography.text16,
          ),
        ),
        const SizedBox(height: 12),
        const MobileTag()
      ],
    );
  }
}

class CardImageWithBtn extends StatelessWidget {
  const CardImageWithBtn({
    Key? key,
    this.cardImageHeight,
    this.cardImageWidth,
    this.btnHeight,
    this.btnWidth,
  }) : super(key: key);

  final double? cardImageHeight;
  final double? cardImageWidth;
  final double? btnHeight;
  final double? btnWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: imageHelper(
            AppImages.trendbook,
            height: cardImageHeight ?? 185,
            width: cardImageWidth ?? 127,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          width: btnWidth ?? 127,
          height: btnHeight,
          decoration: BoxDecoration(
            gradient: AppColors.trendBtn,
            borderRadius: BorderRadius.circular(50),
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
    );
  }
}
