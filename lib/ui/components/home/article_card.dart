import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/books/tags.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 233,
      margin: const EdgeInsets.only(bottom: 36),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: imageHelper(AppImages.article, height: 300),
          ),
          const SizedBox(height: 12),
          Text(
            "Falling for my Boyfriend",
            style: AppTypography.text18.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            "By Sarah john",
            style: AppTypography.text15,
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppColors.grey300,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Romance",
                  style: AppTypography.text13.copyWith(
                    color: AppColors.black600,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Text(
                '4.5',
                style: AppTypography.text14,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ArticleCardMobile extends StatelessWidget {
  const ArticleCardMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      padding: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        // color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: imageHelper(
              AppImages.article,
              // height: 137,
              // width: 107,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The Call of the wild",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTypography.text14.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "By Sarah john",
                  style: AppTypography.text12,
                ),
                const SizedBox(height: 6),
                const MobileTag()
              ],
            ),
          )
        ],
      ),
    );
  }
}
