import 'package:litpad/core/core.dart';
import 'package:litpad/ui/ui.dart';

class MyFansTab extends StatelessWidget {
  const MyFansTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const YBox(50),
        Text(
          "My fan",
          style: AppTypography.text20.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: AppColors.purple50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Your coin for gifting are: ",
                    style: AppTypography.text16.copyWith(
                      color: AppColors.grey900,
                    ),
                  ),
                  Text(
                    "0",
                    style: AppTypography.text16.copyWith(
                      color: AppColors.grey900,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const YBox(26),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _btntext(
                    text: 'Top fans',
                    isActive: false,
                    onPressed: () {},
                  ),
                  const XBox(16),
                  _btntext(
                    text: 'Send coin',
                    isActive: true,
                    onPressed: () {},
                  ),
                  const XBox(16),
                  _btntext(
                      text: 'Gifting history',
                      isActive: false,
                      onPressed: () {}),
                ],
              ),
              const YBox(30),
              const RangeCard(text: "All stories"),
              const YBox(16),
              const AppDivider(color: AppColors.grey300),
              SizedBox(
                height: 300,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      svgHelper(AppSvgs.coins),
                      const YBox(16),
                      const Text(
                        'You don’t have any coin report',
                        style: TextStyle(
                          fontSize: 15,
                          color: AppColors.grey600,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const YBox(100)
      ],
    );
  }

  TextButton _btntext({
    required VoidCallback onPressed,
    required String text,
    bool isActive = false,
  }) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          fontSize: 15,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
          color: isActive ? AppColors.grey900 : AppColors.grey600,
        ),
      ),
    );
  }
}
