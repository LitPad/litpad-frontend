import 'package:go_router/go_router.dart';
import 'package:litpad/core/core.dart';
import 'package:litpad/ui/components/books/books.dart';
import 'package:litpad/ui/components/home/home.dart';
import 'package:provider/provider.dart';

class PopularBooksMobile extends StatelessWidget {
  const PopularBooksMobile({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
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
              const TextBtn(textSize: 14, iconSize: 18)
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
}

class PopularBookDesktop extends StatefulWidget {
  const PopularBookDesktop({
    Key? key,
    this.title,
  }) : super(key: key);

  final String? title;

  @override
  State<PopularBookDesktop> createState() => _PopularBookDesktopState();
}

class _PopularBookDesktopState extends State<PopularBookDesktop> {
  //Todo: Finalise latest book endpoint

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final latestBooks = context.read<ViewLatestBooksVM>();
      final response = await latestBooks.viewLatestBooks();
      printty(response, logLevel: 'LATEST BOOKS');
      if (response.success) {
        printty("Site health check successful!");
      } else {
        printty("Site health check failed: ${response.message}");
      }
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                widget.title ?? "Popular books",
                style: AppTypography.text36.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              const TextBtn()
            ],
          ),
          const YBox(40),
          Wrap(
            spacing: (20),
            runSpacing: (40),
            children: List.generate(2, (index) {
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
}
