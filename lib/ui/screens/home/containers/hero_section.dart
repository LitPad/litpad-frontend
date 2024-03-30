import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/buttons/custom_btn.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => mobileContainer1(),
      tablet: (BuildContext context) => mobileContainer1(),
      desktop: (BuildContext context) => desktopContainer1(),
    );
  }

  //================ MOBILE ===============

  Widget mobileContainer1() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        children: [
          Text(
            'Where writers thrive and readers discover meaningful content',
            textAlign: TextAlign.center,
            style: AppTypography.text30.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const YBox(20),
          Text(
            'Empower authors with creative control, offer readers a diverse literacy experience, ensure transparency in revenue sharing',
            textAlign: TextAlign.center,
            style: AppTypography.text14.copyWith(
              color: AppColors.grey600,
            ),
          ),
          const YBox(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomBtn.withChild(
                height: 44,
                onTap: () {},
                online: true,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Start reading',
                      style: AppTypography.text15.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    const XBox(8),
                    svgHelper(
                      AppSvgs.bookOpen,
                    )
                  ],
                ),
                width: 160,
              ),
              const XBox(20),
              CustomBtn.outlineWithChild(
                height: 44,
                onTap: () {},
                online: true,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Start writing',
                      style: AppTypography.text15,
                    ),
                    const SizedBox(width: 10),
                    svgHelper(
                      AppSvgs.write,
                    )
                  ],
                ),
                width: 154,
              )
            ],
          ),
          const SizedBox(height: 40),
          Container(
            height: w! / 1.2,
            width: w! / 1.2,
            decoration: BoxDecoration(
              color: AppColors.purple900,
              borderRadius: BorderRadius.circular((40)),
            ),
          ),
        ],
      ),
    );
  }

  //============== DESKTOP =============

  Widget desktopContainer1() {
    return Container(
      color: AppColors.bgWhite,
      margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Where writers thrive \nand readers discover \nmeaningful content',
                style: AppTypography.text50.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const YBox(24),
              Text(
                  'Empower authors with creative control, offer readers \na diverse literacy experience, ensure transparency in \nrevenue sharing',
                  style: AppTypography.text18.copyWith(
                    color: AppColors.grey600,
                  )),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  CustomBtn.withChild(
                    height: 54,
                    onTap: () {},
                    online: true,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Start reading',
                          style: AppTypography.text15.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                        const XBox(10),
                        svgHelper(
                          AppSvgs.bookOpen,
                        )
                      ],
                    ),
                    width: 180,
                  ),
                  const XBox(20),
                  CustomBtn.outlineWithChild(
                    height: 54,
                    onTap: () {},
                    online: true,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Start writing',
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
            ],
          )),
          Expanded(
            child: Container(
              height: (530),
              decoration: BoxDecoration(
                color: AppColors.purple900,
                borderRadius: BorderRadius.circular((40)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
