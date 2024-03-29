import 'package:flutter/material.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/components.dart';

class OurVisionScreen extends StatelessWidget {
  const OurVisionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 70,
      ),
      decoration: const BoxDecoration(
        color: AppColors.magneta100,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomBtn.outline(
            height: 40,
            width: 110,
            onTap: () {},
            online: true,
            text: "Our vision",
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Text(
                  'Our vision is to be the world’s most author-friendly platform that enables writers to share their stories and readers to discover a diverse range of affordable and premium fiction across genres',
                  style: AppTypography.text40.copyWith(
                    color: AppColors.purple900,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
