import 'package:go_router/go_router.dart';
import 'package:litpad/core/router/app_router.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/books/books.dart';
import 'package:litpad/ui/components/home/home.dart';
import 'package:responsive_builder/responsive_builder.dart';

class PopularBooks extends StatelessWidget {
  const PopularBooks({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => _mobileView(context, title: title),
      tablet: (BuildContext context) => _mobileView(context, title: title),
      desktop: (BuildContext context) => _desktopView(context),
    );
  }

  _mobileView(BuildContext context, {String? title}) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      margin: const EdgeInsets.only(
        bottom: 20,
        top: 40,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  title ?? "Popular books",
                  style: AppTypography.text20.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              _textBtn(textSize: 14, iconSize: 18)
            ],
          ),
          const YBox(24),
          Wrap(
            spacing: (20),
            runSpacing: (40),
            children: List.generate(6, (index) {
              return SizedBox(
                // color: AppColors.black700,
                width: MediaQuery.of(context).size.width * 0.4,
                child: const ArticleCardMobile(),
              );
            }),
          )
        ],
      ),
    );
  }

  Container _desktopView(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: (60),
        vertical: (54),
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
              _textBtn()
            ],
          ),
          const YBox(40),
          Wrap(
            spacing: (20),
            runSpacing: (40),
            children: List.generate(6, (index) {
              return SizedBox(
                width: (420),
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

  TextButton _textBtn({
    double? textSize,
    double? iconSize,
  }) {
    return TextButton(
      onPressed: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "More",
            style: TextStyle(
              fontSize: textSize ?? 18,
              fontWeight: FontWeight.w500,
              color: AppColors.purple500,
            ),
          ),
          Icon(
            color: AppColors.purple500,
            Icons.chevron_right_outlined,
            size: iconSize ?? 30,
          )
        ],
      ),
    );
  }
}
