import 'package:flutter/material.dart';
import 'package:litpad/core/utils/utils.dart';

class AboutBook extends StatelessWidget {
  const AboutBook({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Synopsis",
          style: AppTypography.text18.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.purple900,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Text(
            "She was a destitute woman whose life was dependent on others. She was forced to be a scapegoat and traded herself, which resulted in her pregnancy. He considered that she was the ultimate embodiment of evil as she was greed and deceitful. She tried all her efforts to win his heart but failed. Her departure made him so furious that he searched through the ends of the world and managed to recapture her. The whole city knew that she would be shredded into a million pieces. She asked him in desperation, “I left our marriage with nothing, so why won’t you let me go?”In a domineering tone, he answered, “You’ve stolen my heart and given birth to my child, and you wish to escape from me?”",
            style: AppTypography.text16.copyWith(
              color: AppColors.purple900,
              height: 1.5,
            ),
          ),
        ),
        const SizedBox(height: 32),
        Text(
          "Tags",
          style: AppTypography.text18.copyWith(
            fontWeight: FontWeight.w500,
            color: AppColors.purple900,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: Wrap(
            spacing: 12,
            children: List.generate(8, (index) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.magneta50,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "Heartbreak",
                  style: AppTypography.text14.copyWith(
                    color: AppColors.magneta900,
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
}
