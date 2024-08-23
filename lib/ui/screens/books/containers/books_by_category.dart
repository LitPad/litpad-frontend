import 'package:go_router/go_router.dart';
import 'package:litpad/core/router/app_router.dart';
import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/books/books.dart';

class BooksByCategory extends StatefulWidget {
  const BooksByCategory({Key? key}) : super(key: key);

  @override
  State<BooksByCategory> createState() => _BooksByCategoryState();
}

class _BooksByCategoryState extends State<BooksByCategory> {
  int _currentPage = 1;
  final int _totalPages = 5;

  final List<String> imgList = [
    AppImages.article,
    AppImages.book2,
    AppImages.book3,
    AppImages.book4,
    AppImages.book5,
  ];

  final List<String> bookTitle = [
    'Falling for my boyfriend\'s dad',
    'Tangled destinies',
    'Morgana',
    'Haunted Desire',
    'Princess Heaven',
  ];

  final List<String> author = [
    'Sarah John',
    'Xenia Litpad',
    'Dark Xenia',
    'DarkXenia',
    'Alexandra Dell',
  ];


  void _handlePageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
    // Any additional logic you want to perform when the page changes
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Adventure",
              style: AppTypography.text40.copyWith(
                color: AppColors.purple900,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 80),
          Wrap(
            spacing: (20),
            runSpacing: (40),
            children: List.generate(imgList.length, (index) {
              return SizedBox(
                width: (420),
                child: BookCard(
                  image: imgList[index],
                  bookTitle: bookTitle[index],
authorName: author[index],                  imgWidth: 174,
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
          ),
          const SizedBox(height: 80),
          // Pagination
          Container(
            padding: const EdgeInsets.only(right: 150),
            child: CustomPagination(
              currentPage: _currentPage,
              totalPages: _totalPages,
              onPageChanged: _handlePageChanged,
            ),
          ),
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}
