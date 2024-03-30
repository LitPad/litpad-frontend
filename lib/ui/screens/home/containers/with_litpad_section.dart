import 'package:litpad/core/utils/utils.dart';
import 'package:responsive_builder/responsive_builder.dart';

class WithLitpadSection extends StatelessWidget {
  const WithLitpadSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => _mobileView(),
      tablet: (BuildContext context) => _mobileView(),
      desktop: (BuildContext context) => _desktopView(),
    );
  }

  Container _mobileView() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "With LitPad",
              style: AppTypography.text24.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const WithLitCardMobile(
            iconPath: AppSvgs.write,
            title: "Author-Friendly Platform",
            description:
                "Providing authors with tools and resources to publish, promote, and monetize their work while retainning creative control",
          ),
          const SizedBox(height: 24),
          const WithLitCardMobile(
            iconPath: AppSvgs.bookOpen,
            iconColor: AppColors.black,
            title: "Reader-Centric Experience",
            description:
                "Curating a diverse selection of literacy content across genres and empowering readers to discover, engage with, and support their favorite authors",
          ),
          const SizedBox(height: 24),
          const WithLitCardMobile(
            iconPath: AppSvgs.magnify,
            title: "Transparency and fairness",
            description:
                "Implementing transparent revenue-sharing models and fostering a community built on trust and collaboration",
          )
        ],
      ),
    );
  }

  Container _desktopView() {
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

class WithLitCardMobile extends StatelessWidget {
  const WithLitCardMobile({
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            border: Border.all(
              color: AppColors.grey400,
              width: 1,
            ),
          ),
          child: svgHelper(
            iconPath,
            width: 20,
            height: 20,
            color: iconColor,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.text18.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                style: AppTypography.text14.copyWith(
                  color: AppColors.grey600,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ],
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
