import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/common/on_hover.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => _footerMobile(),
      tablet: (BuildContext context) => _footerMobile(),
      desktop: (BuildContext context) => _footerDesktop(),
    );
  }

  _footerMobile() {
    return Container(
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              svgHelper(AppSvgs.logo, height: 28, width: 105),
              Row(
                children: [
                  FooterSocials(
                    isMobile: true,
                    assetPath: AppSvgs.x,
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  imageHelper(AppImages.vline, height: 20),
                  const SizedBox(width: 16),
                  FooterSocials(
                    isMobile: true,
                    assetPath: AppSvgs.fb,
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  imageHelper(AppImages.vline, height: 20),
                  const SizedBox(width: 16),
                  FooterSocials(
                    isMobile: true,
                    assetPath: AppImages.ig,
                    isImage: true,
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  imageHelper(AppImages.vline, height: 20),
                  const SizedBox(width: 16),
                  FooterSocials(
                    isMobile: true,
                    assetPath: AppSvgs.lk,
                    onTap: () {},
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Write, read, and enjoy \nquality stories without \nlimits",
            style: AppTypography.text15.copyWith(
              color: AppColors.purple900,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _footerLink(
                    text: "Company",
                    isMobile: true,
                    onPressed: () {},
                  ),
                  _footerLink(
                    text: "About us",
                    isMobile: true,
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _footerLink(
                    text: "Support",
                    isMobile: true,
                    onPressed: () {},
                  ),
                  _footerLink(
                    text: "Contact us",
                    isMobile: true,
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _footerLink(
                    text: "Legal",
                    isMobile: true,
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
          const SizedBox(height: 100),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            alignment: Alignment.center,
            child: Text(
              "© 2024 LitPad",
              style: AppTypography.text14.copyWith(
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _footerDesktop() {
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
    bool isMobile = false,
  }) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.grey600,
            fontWeight: FontWeight.w500,
            fontSize: isMobile ? 14 : 18,
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
    this.isMobile = false,
    this.onTap,
  }) : super(key: key);

  final String assetPath;
  final bool isImage;
  final bool isMobile;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return OnHoverTranslate(
      child: InkWell(
        onTap: onTap,
        child: isImage
            ? imageHelper(
                assetPath,
                height: isMobile ? 16 : 19,
                width: isMobile ? 16 : 20,
              )
            : svgHelper(
                assetPath,
                height: isMobile ? 16 : 19,
                width: isMobile ? 16 : 20,
              ),
      ),
    );
  }
}
