import 'package:flutter/material.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/books/row_icon_with_text.dart';
import 'package:litpad/ui/components/books/tags.dart';

class BookCard extends StatelessWidget {
  const BookCard({
    Key? key,
    this.onImageTap,
  }) : super(key: key);

  final VoidCallback? onImageTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Row(
        children: [
          InkWell(
            onTap: onImageTap,
            child: Container(
              width: 204,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage(AppImages.article),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "The Call of the wild",
                  style: AppTypography.text20.copyWith(
                    color: AppColors.purple900,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "By Herman Merville",
                  style: AppTypography.text16.copyWith(
                    color: AppColors.purple900,
                  ),
                ),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    RowIconWithText(
                      text: "4.5k",
                      icon: Icons.visibility_outlined,
                    ),
                    SizedBox(width: 16),
                    RowIconWithText(
                      text: "20 chapters",
                      icon: Icons.list,
                    ),
                    SizedBox(width: 16),
                    RowIconWithText(
                      text: "4.5",
                      icon: Icons.star,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  "Nobody is stupid enough to venture into unknown territories, except for Ilya. Don't get him wrong! He never meant to enter that mysterious village. ",
                  style: AppTypography.text16.copyWith(
                    color: AppColors.grey500,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: List.generate(
                    3,
                    (index) => Tags(
                      tag: "Poetry",
                      onTap: () => print("Tag pressed"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
