import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/books/row_icon_with_text.dart';
import 'package:litpad/ui/components/books/tags.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    this.imgWidth,
    this.imgheight,
    this.onImageTap,
    this.authorName,
    this.bookTitle, this.bookDescription, this.wordCount
  }) : super(key: key);

  final double? imgWidth;
  final String? bookTitle;
  final String? authorName;
  final String? bookDescription;
  final String? wordCount;
  final double? imgheight;
  final VoidCallback? onImageTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onImageTap,
          child: Container(
            height: (imgheight ?? 0),
            width: (imgWidth ?? 204),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.asset(
              AppImages.article,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const XBox(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bookTitle ?? "The Call of the wild",
                style: AppTypography.text20.copyWith(
                  color: AppColors.purple900,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YBox(6),
              Text(
                "By ${authorName ?? 'Herman Merville'}",
                style: AppTypography.text16.copyWith(
                  color: AppColors.purple900,
                ),
              ),
              const YBox(12),
               Row(
                children: [
                  const RowIconWithText(
                    text: "4.5k",
                    icon: Icons.visibility_outlined,
                  ),
                  const XBox(5),
                   RowIconWithText(
                    text:" ${wordCount ?? "248.k" } words",
                    icon: Icons.edit_outlined,
                  ),
                  const XBox(5),
                  const RowIconWithText(
                    text: "4.5",
                    icon: Icons.star,
                  ),
                ],
              ),
              const YBox(16),
              Text(
                "Nobody is stupid enough to venture into unknown territories, except for Ilya. Don't get him wrong! He never meant to enter that mysterious village. ",
                style: AppTypography.text14.copyWith(
                  color: AppColors.grey500,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const YBox(16),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: List.generate(
                  3,
                  (index) => Tags(
                    tag: "Poetry",
                    onTap: () => printty("Tag pressed"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
