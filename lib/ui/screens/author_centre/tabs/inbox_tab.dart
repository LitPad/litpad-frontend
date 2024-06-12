import 'package:litpad/core/core.dart';
import 'package:litpad/ui/ui.dart';

class InboxTab extends StatelessWidget {
  const InboxTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const YBox(50),
          Text(
            "Inbox",
            style: AppTypography.text20.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const YBox(30),
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.grey300,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 7),
                        width: 210,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.fromBorderSide(
                            BorderSide(
                              color: AppColors.grey300,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "The good boy",
                              style: AppTypography.text15,
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                      const YBox(24),
                      Row(
                        children: [
                          _innerTab(
                            title: "All",
                            isSelected: true,
                            onTap: () {},
                          ),
                          const XBox(10),
                          _innerTab(
                            title: "Comment ",
                            onTap: () {},
                          ),
                          const XBox(10),
                          _innerTab(
                            title: "Following",
                            onTap: () {},
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const AppDivider(color: AppColors.grey300),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, i) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                              child: const AvatarListTile(
                                isMobile: false,
                                avatarRadius: 20,
                                imageUrl:
                                    'https://images.pexels.com/photos/1516680/pexels-photo-1516680.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                name: 'Temitope just followed you',
                                subTitle: '8 min ago',
                              ),
                            );
                          },
                          separatorBuilder: (ctx, _) =>
                              const AppDivider(color: AppColors.grey300),
                          itemCount: 3),
                    ],
                  ),
                ),
                const YBox(20),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  margin: const EdgeInsets.only(left: 100),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    border: Border.fromBorderSide(
                      BorderSide(
                        color: AppColors.grey300,
                        width: 1,
                      ),
                    ),
                  ),
                  child: Text(
                    "The plot of the whole story is still just really awesome",
                    style: AppTypography.text15,
                  ),
                ),
                const YBox(24),
              ],
            ),
          ),
          YBox(MediaQuery.of(context).size.height),
        ],
      ),
    );
  }

  Widget _innerTab({
    required String title,
    VoidCallback? onTap,
    bool isSelected = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? AppColors.grey000 : AppColors.transparent,
        ),
        child: Text(
          title,
          style: TextStyle(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              fontSize: 14,
              color: isSelected ? AppColors.black : AppColors.grey600),
        ),
      ),
    );
  }
}
