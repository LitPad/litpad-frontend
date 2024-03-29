import 'package:flutter/material.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/buttons/custom_btn.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => mobileContainer1(),
      desktop: (BuildContext context) => desktopContainer1(),
    );
  }

  //================ MOBILE ===============

  Widget mobileContainer1() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: w! / 10, vertical: 20),
      child: Column(
        children: [
          Container(
            height: w! / 1.2,
            width: w! / 1.2,
            color: AppColors.primaryPurple,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Track your \nExpenses to \nSave Money',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: w! / 10, fontWeight: FontWeight.bold, height: 1),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Helps you to organize your income and expenses',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 45,
            child: ElevatedButton.icon(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(AppColors.primaryPurple)),
                onPressed: () {},
                icon: const Icon(Icons.arrow_drop_down),
                label: const Text('Try a Demo')),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '— Web, iOs and Android',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
          )
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
              height: Sizer.height(530),
              decoration: BoxDecoration(
                color: AppColors.purple900,
                borderRadius: BorderRadius.circular(Sizer.radius(40)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
