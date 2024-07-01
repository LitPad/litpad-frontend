import 'package:go_router/go_router.dart';
import 'package:litpad/core/core.dart';
import 'package:litpad/ui/ui.dart';
import 'package:provider/provider.dart';

// class StoryTab extends StatelessWidget {
//   const StoryTab({
//     Key? key,
//     this.isMobile = false,
//   }) : super(key: key);
//
//   final bool isMobile;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (!isMobile)
//           Row(
//             children: [
//               Expanded(
//                 flex: 5,
//                 child: _storyCard(context),
//               ),
//               const XBox(40),
//               Expanded(
//                 flex: 2,
//                 child: _dateCard(),
//               )
//             ],
//           ),
//         if (isMobile) _storyCard(context),
//         if (isMobile) const YBox(20),
//         if (isMobile) _dateCard(),
//         const YBox(50),
//         Container(
//           height: 360,
//           width: 584,
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: AppColors.grey300,
//               width: 1,
//             ),
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 16,
//                   horizontal: 16,
//                 ),
//                 decoration: const BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       color: AppColors.grey300,
//                       width: 1,
//                     ),
//                   ),
//                 ),
//                 child: const Row(
//                   children: [
//                     Text(
//                       "Events",
//                       style: TextStyle(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w500,
//                         color: AppColors.grey900,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 24,
//                   horizontal: 16,
//                 ),
//                 child: imageHelper(AppImages.prize),
//               ),
//             ],
//           ),
//         ),
//         const YBox(130),
//       ],
//     );
//   }
//
//   Container _dateCard() {
//     return Container(
//       height: 450,
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: AppColors.grey300,
//           width: 1,
//         ),
//         borderRadius: BorderRadius.circular(12),
//       ),
//     );
//   }
//
//   Widget _storyCard(BuildContext context) {
//     // return Consumer<ViewLatestBookByAuthorVM>(
//     //     builder: (context, authorBooksVM, _) {
//     //   return Container(
//     //     height: 450,
//     //     decoration: BoxDecoration(
//     //       border: Border.all(
//     //         color: AppColors.grey300,
//     //         width: 1,
//     //       ),
//     //       borderRadius: BorderRadius.circular(12),
//     //     ),
//     //     child: Column(
//     //       children: [
//     //         Container(
//     //           padding: const EdgeInsets.symmetric(
//     //             vertical: 16,
//     //             horizontal: 16,
//     //           ),
//     //           decoration: const BoxDecoration(
//     //             border: Border(
//     //               bottom: BorderSide(
//     //                 color: AppColors.grey300,
//     //                 width: 1,
//     //               ),
//     //             ),
//     //           ),
//     //           child: const Row(
//     //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //             children: [
//     //               Text(
//     //                 "Stories",
//     //                 style: TextStyle(
//     //                     fontSize: 15,
//     //                     fontWeight: FontWeight.w500,
//     //                     color: AppColors.grey900),
//     //               ),
//     //               Text(
//     //                 "view all stories",
//     //                 style: TextStyle(
//     //                   fontSize: 15,
//     //                   color: AppColors.purple600,
//     //                 ),
//     //               )
//     //             ],
//     //           ),
//     //         ),
//     //         Expanded(
//     //           child: Column(
//     //             mainAxisSize: MainAxisSize.min,
//     //             mainAxisAlignment: MainAxisAlignment.center,
//     //             children: [
//     //               imageHelper(AppImages.book, height: 80, width: 102),
//     //               const YBox(30),
//     //               const Text(
//     //                 "You have no stories yet",
//     //                 style: TextStyle(
//     //                   fontSize: 15,
//     //                   color: AppColors.grey600,
//     //                 ),
//     //               ),
//     //               const YBox(16),
//     //               BtnContainer(
//     //                 onTap: () {
//     //                   context.goNamed(RoutePath.createStoryScreen);
//     //                 },
//     //                 padding: const EdgeInsets.symmetric(
//     //                   horizontal: 28,
//     //                   vertical: 14,
//     //                 ),
//     //                 text: "Create story",
//     //               )
//     //             ],
//     //           ),
//     //         )
//     //       ],
//     //     ),
//     //   );
//     // });
//     return Consumer<ViewLatestBookByAuthorVM>(
//       builder: (context, authorBooksVM, _) {
//         if (authorBooksVM.booksResponse == null && authorBooksVM.booksResponse!.books.isEmpty) {
//           return Container(
//             height: 450,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: AppColors.grey300,
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 imageHelper(AppImages.book, height: 80, width: 102),
//                 const YBox(30),
//                 const Text(
//                   "You have no stories yet",
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: AppColors.grey600,
//                   ),
//                 ),
//                 const YBox(16),
//                 BtnContainer(
//                   onTap: () {
//                     context.goNamed(RoutePath.createStoryScreen);
//                   },
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 28,
//                     vertical: 14,
//                   ),
//                   text: "Create story",
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return Container(
//             height: 450,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: AppColors.grey300,
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: ListView.builder(
//               itemCount: authorBooksVM.booksResponse!.books.length,
//               itemBuilder: (context, index) {
//                 final book = authorBooksVM.booksResponse!.books[index];
//                 return ListTile(
//                   leading: Image.network(book.coverImage),
//                   title: Text(book.title),
//                   subtitle: Text(book.blurb),
//                 );
//               },
//             ),
//           );
//         }
//       },
//     );
//   }
// }

class StoryTab extends StatefulWidget {
  final bool isMobile;

  const StoryTab({
    Key? key,
    this.isMobile = false,
  }) : super(key: key);

  @override
  _StoryTabState createState() => _StoryTabState();
}

class _StoryTabState extends State<StoryTab> {
  @override
  void initState() {
    super.initState();
    _fetchAuthorBooks();
  }

  Future<void> _fetchAuthorBooks() async {
    final viewModel = context.read<ViewLatestBookByAuthorVM>();
    await viewModel.viewBookByAuthor();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ViewLatestBookByAuthorVM>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!widget.isMobile)
          Row(
            children: [
              Expanded(
                flex: 5,
                child: _storyCard(context),
              ),
              // const XBox(40),
              // viewModel.booksResponse == null
              //     ? Expanded(
              //         flex: 2,
              //         child: _dateCard(),
              //       )
              //     : const SizedBox(),
            ],
          ),
        if (widget.isMobile) _storyCard(context),
        if (widget.isMobile) const YBox(20),
        if (widget.isMobile) _dateCard(),
        const YBox(50),
        Container(
          height: 360,
          width: 584,
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.grey300,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: AppColors.grey300,
                      width: 1,
                    ),
                  ),
                ),
                child: const Row(
                  children: [
                    Text(
                      "Events",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grey900,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: imageHelper(AppImages.prize),
              ),
            ],
          ),
        ),
        const YBox(130),
      ],
    );
  }

  Container _dateCard() {
    return Container(
      height: 450,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _storyCard(BuildContext context) {
    return Consumer<ViewLatestBookByAuthorVM>(
      builder: (context, authorBooksVM, _) {
        if (authorBooksVM.isLoading == false) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (authorBooksVM.booksResponse == null ||
              authorBooksVM.booksResponse!.books.isEmpty) {
            return Container(
              height: 450,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey300,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imageHelper(AppImages.book, height: 80, width: 102),
                  const YBox(30),
                  const Text(
                    "You have no stories yet",
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.grey600,
                    ),
                  ),
                  const YBox(16),
                  BtnContainer(
                    onTap: () {
                      context.goNamed(RoutePath.createStoryScreen);
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 14,
                    ),
                    text: "Create story",
                  ),
                ],
              ),
            );
          } else {
            return Container(
              height: 450,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.grey300,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.builder(
                itemCount: authorBooksVM.booksResponse!.books.length,
                itemBuilder: (context, index) {
                  final book = authorBooksVM.booksResponse!.books[index];
                  return Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    margin: const EdgeInsets.all(15),
                    height: 228,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.grey300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                                height: 172,
                                width: 134,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      book.coverImage,
                                      fit: BoxFit.cover,
                                    ))),
                            const XBox(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  book.title,
                                  style: AppTypography.text14Bold,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(book.views.toString()),
                                    const XBox(80),
                                    Text(book.chaptersCount.toString()),
                                    const XBox(100),
                                    Text(book.chaptersCount.toString()),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Views'),
                                    XBox(10),
                                    Text('Subscription'),
                                    XBox(10),
                                    Text('Chapter count'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.more_horiz_outlined),
                            CustomBtn.outlineWithChild(
                                width: 177,
                                height: 43,
                                borderRadius: 100,
                                onTap: () {},
                                online: true,
                                child: const Text('Add new chapter')),
                            TextButton(
                              onPressed: () {},
                              child: const Text('Apply for contract',
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: AppColors.primaryPurple)),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          }
        }
      },
    );
  }
}
