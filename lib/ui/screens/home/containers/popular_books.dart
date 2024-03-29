import 'package:go_router/go_router.dart';
import 'package:litpad/core/router/app_router.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/books/books.dart';

class PopularBooks extends StatelessWidget {
  const PopularBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizer.screenWidth,
      padding: EdgeInsets.symmetric(
        horizontal: Sizer.width(60),
        vertical: Sizer.height(54),
      ),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(36),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Popular books",
                style: AppTypography.text36.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "More",
                      style: AppTypography.text18.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.purple500,
                      ),
                    ),
                    Icon(
                      color: AppColors.purple500,
                      Icons.chevron_right_outlined,
                      size: Sizer.radius(30),
                    )
                  ],
                ),
              )
            ],
          ),
          const YBox(40),
          Wrap(
            spacing: Sizer.width(20),
            runSpacing: Sizer.height(40),
            children: List.generate(6, (index) {
              return SizedBox(
                width: Sizer.width(420),
                child: BookCard(
                  imgWidth: 174,
                  imgheight: 225,
                  onImageTap: () {
                    context
                        .goNamed(RoutePath.bookDetailsScreen, pathParameters: {
                      'id': '1',
                    });
                  },
                ),
              );
            }),
          )
          // GridView.count(
          //   padding: EdgeInsets.only(
          //     bottom: MediaQuery.of(context).size.height * 0.1,
          //   ),
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   crossAxisCount: 3,
          //   crossAxisSpacing: 20,
          //   mainAxisSpacing: 30,
          //   childAspectRatio: 400 / 234,
          //   children: [

          //     BookCard(
          //       imgWidth: 174,
          //       onImageTap: () {
          //         context.goNamed(RoutePath.bookDetailsScreen, pathParameters: {
          //           'id': '1',
          //         });
          //       },
          //     ),
          //     BookCard(
          //       imgWidth: 174,
          //       onImageTap: () {
          //         context.goNamed(RoutePath.bookDetailsScreen, pathParameters: {
          //           'id': '1',
          //         });
          //       },
          //     ),
          //     BookCard(
          //       imgWidth: 174,
          //       onImageTap: () {
          //         context.goNamed(RoutePath.bookDetailsScreen, pathParameters: {
          //           'id': '1',
          //         });
          //       },
          //     ),
          //     BookCard(
          //       imgWidth: 174,
          //       onImageTap: () {
          //         context.goNamed(RoutePath.bookDetailsScreen, pathParameters: {
          //           'id': '1',
          //         });
          //       },
          //     ),
          //     BookCard(
          //       imgWidth: 174,
          //       onImageTap: () {
          //         context.goNamed(RoutePath.bookDetailsScreen, pathParameters: {
          //           'id': '1',
          //         });
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
