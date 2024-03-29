import 'package:flutter/material.dart';
import 'package:litpad/core/utils/utils.dart';

class WithLitpadSection extends StatelessWidget {
  const WithLitpadSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 80,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "With LitPad",
              style: AppTypography.text50.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 60),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: WithLitCard(
                  iconPath: AppSvgs.write,
                  title: "Author-Friendly Platform",
                  description:
                      "Providing authors with tools and resources to publish, promote, and monetize their work while retainning creative control",
                ),
              ),
              XBox(50),
              Expanded(
                child: WithLitCard(
                  iconPath: AppSvgs.bookOpen,
                  iconColor: AppColors.black,
                  title: "Reader-Centric Experience",
                  description:
                      "Curating a diverse selection of literacy content across genres and empowering readers to discover, engage with, and support their favorite authors",
                ),
              ),
              XBox(50),
              Expanded(
                child: WithLitCard(
                  iconPath: AppSvgs.magnify,
                  title: "Transparency and fairness",
                  description:
                      "Implementing transparent revenue-sharing models and fostering a community built on trust and collaboration",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class WithLitCard extends StatelessWidget {
  const WithLitCard({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.description,
    this.iconColor,
  }) : super(key: key);

  final String iconPath;
  final String title;
  final String description;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.grey400,
              width: 1,
            ),
          ),
          child: svgHelper(
            iconPath,
            width: 30,
            height: 30,
            color: iconColor,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          title,
          style: AppTypography.text22.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: AppTypography.text16.copyWith(
            color: AppColors.grey600,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
