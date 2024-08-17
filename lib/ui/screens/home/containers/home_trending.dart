import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/books/books.dart';
import 'package:litpad/ui/components/components.dart';

import 'home_rising_sidebar.dart';

class HomeTrendingDesktop extends StatefulWidget {
  HomeTrendingDesktop({super.key});

  @override
  State<HomeTrendingDesktop> createState() => _HomeTrendingDesktopState();
}

class _HomeTrendingDesktopState extends State<HomeTrendingDesktop> {
  int _currentIndex = 0;
  final List<String> imgList = [
    AppImages.article,
    AppImages.book2,
    AppImages.book3,
    AppImages.book4,
    AppImages.book5,
  ];

  final List<String> bookTitle = [
    'Falling for my boyfriend\'s dad',
    'Tangled destinies',
    'Morgana',
    'Haunted Desire',
    'Princess Heaven',
  ];

  final List<String> author = [
    'Sarah John',
    'Xenia Litpad',
    'Dark Xenia',
    'DarkXenia',
    'Alexandra Dell',
  ];

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
                const YBox(20),
                Container(
                  // padding: const EdgeInsets.symmetric(
                  //   vertical: 50,
                  // ),
                  decoration: BoxDecoration(
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SizedBox(
                    height: 794,
                    child: CarouselSlider.builder(
                        options: CarouselOptions(
                          viewportFraction: 0.45,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          height: 600,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          aspectRatio: 12 / 9,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                        itemCount: imgList.length,
                        itemBuilder: (context, index, realIndex) => Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: SizedBox(
                                    height: 293,
                                    width: 234,
                                    child: Image.asset(
                                      imgList[index],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 234,
                                  height: 40,
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
                                ),
                                CardDetailSMobile(
                                  bookTitle: bookTitle[index],
                                  authorName: author[index],
                                )
                              ],
                            )),
                    // ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: imgList.length,
                    //     itemBuilder: (context, index) {
                    //       return Column(
                    //         children: [
                    //           CardImageWithBtn(
                    //             cardImageHeight: 251,
                    //             cardImageWidth: 218,
                    //             btnHeight: 42,
                    //             btnWidth: 230,
                    //             image: imgList[index],
                    //           ),
                    //           const YBox(40),
                    //           CardDetailSMobile(
                    //             bookTitle: bookTitle[index],
                    //             authorName: author[index],
                    //           )
                    //         ],
                    //       );
                    //     }),
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
  final String? authorName;
  final String? bookTitle;
  final String? bookDescription;
  const CardDetailSMobile({
    super.key,
    this.authorName,
    this.bookTitle,
    this.bookDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            bookTitle ?? "An affair with a notorious heiress",
            textAlign: TextAlign.center,
            style: AppTypography.text20.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const YBox(8),
          Text(
            "By ${authorName ?? 'moria'}",
            style: AppTypography.text16,
          ),
          const YBox(10),
          const MobileTag(),
          const YBox(10),
          Text(
            bookDescription ??
                "Nobody is stupid enough to venture into unknown territories, except for Ilya. Don't get him",
            textAlign: TextAlign.center,
            style: AppTypography.text14,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class HomeTrendingMobile extends StatelessWidget {
  HomeTrendingMobile({super.key});
  final List<String> imgList = [
    AppImages.article,
    AppImages.book2,
    AppImages.book3,
    AppImages.book4,
    AppImages.book5,
  ];
  final List<String> bookTitle = [
    'Falling for my boyfriend\'s dad',
    'Tangled destinies',
    'Morgana',
    'Haunted Desire',
    'Princess Heaven',
  ];
  final List<String> author = [
    'Sarah John',
    'Xenia Litpad',
    'Dark Xenia',
    'DarkXenia',
    'Alexandra Dell',
  ];

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
                        CardImageWithBtn(
                          image: imgList[i],
                        ),
                        const XBox(16),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: CardDetails(
                              authorName: author[i],
                              bookTitle: bookTitle[i],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (ctx, _) => const YBox(24),
                  itemCount: imgList.length,
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
  final String? authorName;
  final String? bookTitle;
  final String? bookDescription;
  const CardDetails({
    super.key,
    this.authorName,
    this.bookTitle,
    this.bookDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bookTitle ?? "Alluring aurora",
          style: AppTypography.text16.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const YBox(4),
        Text(
          "By ${authorName ?? 'moria'}",
          style: AppTypography.text14,
        ),
        const YBox(10),
        Container(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            bookDescription ??
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
    this.image,
  }) : super(key: key);

  final double? cardImageHeight;
  final double? cardImageWidth;
  final double? btnHeight;
  final double? btnWidth;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: imageHelper(
            image ?? AppImages.trendbook,
            height: cardImageHeight ?? 185,
            width: cardImageWidth ?? 127,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 4,
          ),
          margin: const EdgeInsets.only(top: 10),
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
