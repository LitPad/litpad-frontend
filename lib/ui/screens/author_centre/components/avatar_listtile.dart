import 'package:litpad/core/core.dart';

class AvatarListTile extends StatelessWidget {
  const AvatarListTile({
    Key? key,
    this.isMobile = false,
    required this.imageUrl,
    required this.name,
    required this.subTitle,
    this.avatarRadius,
  }) : super(key: key);

  final bool isMobile;
  final String imageUrl;
  final String name;
  final String subTitle;
  final double? avatarRadius;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: avatarRadius,
          backgroundImage: NetworkImage(imageUrl),
        ),
        const XBox(20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: AppColors.purple900,
                fontWeight: FontWeight.w500,
              ),
            ),
            const YBox(4),
            Text(
              subTitle,
              style: TextStyle(
                fontSize: isMobile ? 12 : 14,
                color: AppColors.grey600,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
