import 'package:litpad/core/utils/utils.dart';

class AvatarContainerDeskTop extends StatelessWidget {
  const AvatarContainerDeskTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            bottom: 25,
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
                        Row(
                          children: [
                            Text(
                              'Temitope',
                              style: AppTypography.text32.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const XBox(12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.grey200,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'ID 70987210',
                                    style: AppTypography.text15,
                                  ),
                                  const XBox(8),
                                  svgHelper(AppSvgs.copy1)
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Change picture',
                          style: AppTypography.text20.copyWith(
                            color: AppColors.purple500,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.purple500,
                          ),
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

class AvatarContainerMobile extends StatelessWidget {
  const AvatarContainerMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgWhite,
      width: MediaQuery.of(context).size.width,
      height: 310,
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
            bottom: 6,
            child: Container(
              margin: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  const AvatarClip(isMobile: true),
                  const XBox(25),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Temitope',
                              style: AppTypography.text18.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const XBox(12),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.grey200,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'ID 70987210',
                                    style: AppTypography.text12,
                                  ),
                                  const XBox(8),
                                  svgHelper(AppSvgs.copy1)
                                ],
                              ),
                            ),
                          ],
                        ),
                        const YBox(4),
                        Text(
                          'Change picture',
                          style: AppTypography.text14.copyWith(
                            color: AppColors.purple500,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.purple500,
                          ),
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
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? 100 : 200,
      width: isMobile ? 100 : 200,
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
