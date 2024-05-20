import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/buttons/custom_btn.dart';

class JoinLitpadContainer extends StatelessWidget {
  const JoinLitpadContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 60,
      ).copyWith(
        top: 80,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 90,
        vertical: 90,
      ),
      decoration: BoxDecoration(
        color: AppColors.magneta100,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Ignite your writing journey \non LitPad',
                  style: AppTypography.text40.copyWith(
                    color: AppColors.magneta900,
                  ),
                ),
                const YBox(16),
                Text(
                  'Join LitPad for a rewarding writing experience \nYour creativing, your community, your journey',
                  style: AppTypography.text20.copyWith(
                    color: AppColors.grey800,
                  ),
                ),
                const YBox(32),
                CustomBtn.outlineWithChild(
                  onTap: () {},
                  bgColor: AppColors.white,
                  online: true,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'start writing',
                        style: AppTypography.text15,
                      ),
                      const SizedBox(width: 10),
                      svgHelper(
                        AppSvgs.write,
                      )
                    ],
                  ),
                  width: 170,
                )
              ],
            ),
          ),
          const XBox(80),
          const Expanded(
              child: Column(
            children: [
              JoinIconWithColumnText(
                assetPath: AppSvgs.rocket,
                title: 'Unleash creativity',
                subtitle:
                    'Break free from the restrictions and explore diverse genres with the freedom to express',
              ),
              YBox(36),
              JoinIconWithColumnText(
                assetPath: AppSvgs.people,
                title: 'Community connection',
                subtitle:
                    'Engage with a vibrant community, boost visibility through author-centric promotions, and relish appreciation in the gift centre',
              ),
              YBox(36),
              JoinIconWithColumnText(
                assetPath: AppSvgs.muscle,
                title: 'UEmpowering features',
                subtitle:
                    'Transparent compensation, insightful analytics, and flexible publishing give you the tools to thrive on LitPad',
              ),
            ],
          ))
        ],
      ),
    );
  }
}

class JoinIconWithColumnText extends StatelessWidget {
  const JoinIconWithColumnText({
    Key? key,
    required this.assetPath,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String assetPath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: svgHelper(
            assetPath,
            width: 30,
            height: 30,
          ),
        ),
        const XBox(20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTypography.text22.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.magneta900,
                ),
              ),
              const YBox(4),
              Text(
                subtitle,
                style: AppTypography.text15.copyWith(
                  color: AppColors.magneta900,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
