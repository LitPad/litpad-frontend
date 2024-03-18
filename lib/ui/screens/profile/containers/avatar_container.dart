import 'package:flutter/material.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/buttons/custom_btn.dart';

class AvatarContainer extends StatelessWidget {
  const AvatarContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 60),
      color: AppColors.white,
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 235,
            decoration: const BoxDecoration(
              gradient: AppColors.avaterContainerLG,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: 30,
            child: Row(
              children: [
                CustomBtn.outlineWithChild(
                  onTap: () {},
                  online: true,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.message,
                        color: AppColors.purple900,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'Message',
                        style: AppTypography.text15,
                      ),
                    ],
                  ),
                  width: 170,
                ),
                const SizedBox(width: 12),
                CustomBtn.solid(
                  onTap: () {},
                  online: true,
                  text: 'Sign up',
                  width: 110,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            child: Container(
              margin: const EdgeInsets.only(
                left: 50,
              ),
              child: Row(
                children: [
                  const AvatarClip(),
                  const SizedBox(width: 25),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Herman Merville',
                          style: AppTypography.text32.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '45 followers',
                              style: AppTypography.text16.copyWith(
                                color: AppColors.grey600,
                              ),
                            ),
                            Text(
                              '10 books',
                              style: AppTypography.text16.copyWith(
                                color: AppColors.grey600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class AvatarClip extends StatelessWidget {
  const AvatarClip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(400),
        border: Border.all(
          color: AppColors.white,
          width: 5,
        ),
        image: const DecorationImage(
          image: NetworkImage(
            "https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
