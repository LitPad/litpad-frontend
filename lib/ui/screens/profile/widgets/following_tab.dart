import 'package:litpad/core/core.dart';

class FollowingTab extends StatelessWidget {
  const FollowingTab({Key? key, this.isMobile = false}) : super(key: key);

  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("4 Following",
            style: TextStyle(
              fontSize: isMobile ? 16 : 22,
              fontWeight: FontWeight.w500,
              color: AppColors.purple900,
            )),
        YBox(isMobile ? 20 : 50),
        ...List.generate(4, (index) {
          return FollowingCard(
            isMobile: isMobile,
            imageUrl:
                'https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            name: 'Debra Light',
            store: '2 stores',
            followers: '24 followers',
          );
        })
      ],
    );
  }
}

class FollowingCard extends StatelessWidget {
  const FollowingCard({
    Key? key,
    required this.isMobile,
    required this.imageUrl,
    required this.name,
    required this.store,
    required this.followers,
    this.margin,
  }) : super(key: key);

  final bool isMobile;
  final String imageUrl;
  final String name;
  final String store;
  final String followers;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? EdgeInsets.only(bottom: isMobile ? 16 : 24),
      child: Row(
        children: [
          CircleAvatar(
            radius: isMobile ? 18 : 30,
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
              const YBox(6),
              Row(
                children: [
                  Text(
                    store,
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 14,
                      color: AppColors.grey600,
                    ),
                  ),
                  const XBox(6),
                  Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(
                        color: AppColors.grey600,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const XBox(6),
                  Text(
                    followers,
                    style: TextStyle(
                      fontSize: isMobile ? 12 : 14,
                      color: AppColors.grey600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
