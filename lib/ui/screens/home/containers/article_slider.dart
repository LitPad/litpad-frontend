import 'package:litpad/core/core.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/books/tags.dart';
import 'package:litpad/ui/components/home/text_btn.dart';

class ArticleSlider extends StatelessWidget {
   ArticleSlider({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;
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
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 50,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTypography.text36.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextBtn()
            ],
          ),
          const YBox(40),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                imgList.length,
                (index) {
                  return  SliderArticleCard(img: imgList[index], title: bookTitle[index], author: author[index],);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SliderArticleCard extends StatelessWidget {
  final String? img;
  final String? title;
  final String? author;
  const SliderArticleCard({
    super.key,
    this.img,
    this.title,
    this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            height: 260,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: imageHelper(
                img ?? AppImages.article,
              ),
            ),
          ),
          const YBox(12),
          Text(
            title ?? "Falling for my Boyfriend",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.text16.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const YBox(4),
          Text(
            "By ${author ?? 'Sarah john'}",
            overflow: TextOverflow.ellipsis,
            style: AppTypography.text15,
          ),
          const YBox(12),
          const MobileTag(),
        ],
      ),
    );
  }
}
