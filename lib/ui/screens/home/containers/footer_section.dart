import 'package:flutter/material.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/common/on_hover.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 2,
                child: FooterAbout(),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _footerLink(
                            text: "Company",
                            onPressed: () {},
                          ),
                          _footerLink(
                            text: "About us",
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _footerLink(
                          text: "Support",
                          onPressed: () {},
                        ),
                        _footerLink(
                          text: "Contact us",
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _footerLink(
                          text: "Legal",
                          onPressed: () {},
                        ),
                        _footerLink(
                          text: "Privacy",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Text(
              "© 2024 LitPad",
              style: AppTypography.text16.copyWith(
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton _footerLink({
    required String text,
    VoidCallback? onPressed,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          text,
          style: AppTypography.text18.copyWith(
            color: AppColors.grey600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class FooterAbout extends StatelessWidget {
  const FooterAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        svgHelper(AppSvgs.logo, height: 35, width: 125),
        const SizedBox(height: 16),
        Text(
          "Write, read, and enjoy \nquality stories without \nlimits",
          style: AppTypography.text22,
        ),
        const SizedBox(height: 40),
        Row(
          children: [
            FooterSocials(
              assetPath: AppSvgs.x,
              onTap: () {},
            ),
            const SizedBox(width: 16),
            imageHelper(AppImages.vline, height: 20),
            const SizedBox(width: 16),
            FooterSocials(
              assetPath: AppSvgs.fb,
              onTap: () {},
            ),
            const SizedBox(width: 16),
            imageHelper(AppImages.vline, height: 20),
            const SizedBox(width: 16),
            FooterSocials(
              assetPath: AppImages.ig,
              isImage: true,
              onTap: () {},
            ),
            const SizedBox(width: 16),
            imageHelper(AppImages.vline, height: 20),
            const SizedBox(width: 16),
            FooterSocials(
              assetPath: AppSvgs.lk,
              onTap: () {},
            ),
          ],
        )
      ],
    );
  }
}

class FooterSocials extends StatelessWidget {
  const FooterSocials({
    Key? key,
    required this.assetPath,
    this.isImage = false,
    this.onTap,
  }) : super(key: key);

  final String assetPath;
  final bool isImage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return OnHoverTranslate(
      child: InkWell(
        onTap: onTap,
        child: isImage
            ? imageHelper(
                assetPath,
                height: 19,
                width: 20,
              )
            : svgHelper(
                assetPath,
                height: 19,
                width: 20,
              ),
      ),
    );
  }
}
