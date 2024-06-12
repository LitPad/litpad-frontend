import 'package:litpad/core/core.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/ui.dart';

class TopupSectionDesktop extends StatefulWidget {
  const TopupSectionDesktop({Key? key}) : super(key: key);

  @override
  State<TopupSectionDesktop> createState() => _TopupSectionDesktopState();
}

class _TopupSectionDesktopState extends State<TopupSectionDesktop> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      padding: const EdgeInsets.only(top: 70, left: 60),
      child: const TopupCardContent(),
    );
  }
}

class TopupSectionMobile extends StatefulWidget {
  const TopupSectionMobile({Key? key}) : super(key: key);

  @override
  State<TopupSectionMobile> createState() => _TopupSectionMobileState();
}

class _TopupSectionMobileState extends State<TopupSectionMobile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
      ),
      child: const TopupCardContent(isMobile: true),
    );
  }
}

class TopupCardContent extends StatelessWidget {
  const TopupCardContent({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const YBox(40),
        Text(
          "Wallet",
          style: TextStyle(
            fontSize: isMobile ? 20 : 32,
            fontWeight: FontWeight.w500,
          ),
        ),
        const YBox(20),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 28,
          ),
          decoration: BoxDecoration(
            color: AppColors.purple100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                      ),
                      child: Text(
                        "Coins",
                        style: TextStyle(
                          color: AppColors.purple800,
                          fontSize: isMobile ? 16 : 22,
                        ),
                      ),
                    ),
                    const YBox(20),
                    imageHelper(
                      AppImages.coin,
                      height: 61,
                      width: 61,
                    )
                  ],
                ),
              ),
              BtnContainer(
                text: "Top up",
                fontSize: isMobile ? 16 : 18,
              )
            ],
          ),
        )
      ],
    );
  }
}
