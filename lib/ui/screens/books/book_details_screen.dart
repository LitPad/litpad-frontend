import 'package:go_router/go_router.dart';
import 'package:litpad/core/router/app_router.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/books/row_icon_with_text.dart';
import 'package:litpad/ui/components/components.dart';

import 'containers/books_tab_menu_section.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 60,
            ),
            child: Column(
              children: [
                constraints.maxWidth >= 950
                    ? const DeskTopNavbar()
                    : const MobileNavbar(),
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 40,
                  ),
                  color: AppColors.white,
                  height: 260,
                  child: Row(
                    children: [
                      Container(
                        width: 190,
                        height: 260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                            image: AssetImage(AppImages.article),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "The Call of the wild",
                                  style: AppTypography.text20.copyWith(
                                    color: AppColors.purple900,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        context.goNamed(
                                            RoutePath.authorsDetailScreen,
                                            pathParameters: {'id': '1'});
                                      },
                                      child: Text(
                                        "By Herman Merville",
                                        style: AppTypography.text16.copyWith(
                                          color: AppColors.purple900,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 4,
                                      width: 4,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                        color: AppColors.grey300,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    Text(
                                      "Follow",
                                      style: AppTypography.text16.copyWith(
                                        color: AppColors.green,
                                      ),
                                    ),
                                    Container(
                                      height: 4,
                                      width: 4,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      decoration: BoxDecoration(
                                        color: AppColors.grey300,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.green100,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        "Completed",
                                        style: AppTypography.text16.copyWith(
                                          color: AppColors.green,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                const Row(
                                  children: [
                                    RowIconWithText(
                                      text: "4.5k",
                                      icon: Icons.visibility_outlined,
                                    ),
                                    SizedBox(width: 16),
                                    RowIconWithText(
                                      text: "20 chapters",
                                      icon: Icons.list,
                                    ),
                                    SizedBox(width: 16),
                                    RowIconWithText(
                                      text: "5 votes",
                                      icon: Icons.how_to_vote_outlined,
                                    ),
                                    SizedBox(width: 16),
                                    RowIconWithText(
                                      text: "4.5",
                                      icon: Icons.star,
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // const Spacer(),
                            Row(
                              children: [
                                CustomBtn.withChild(
                                  onTap: () {},
                                  online: true,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'start writing',
                                        style: AppTypography.text15.copyWith(
                                          color: AppColors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      svgHelper(AppSvgs.write,
                                          color: AppColors.white)
                                    ],
                                  ),
                                  width: 170,
                                ),
                                const SizedBox(width: 40),
                                const Icon(
                                  Icons.bookmark_border_outlined,
                                  color: AppColors.grey600,
                                  size: 30,
                                ),
                                const SizedBox(width: 40),
                                const Icon(
                                  Icons.ios_share,
                                  color: AppColors.grey600,
                                  size: 30,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                const BooksTabMenuSection(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 40, horizontal: 60),
                  child: const Divider(
                    color: AppColors.grey300,
                  ),
                ),
                const FooterSection(),
              ],
            ),
          ),
        ),
      );
    });
  }
}
