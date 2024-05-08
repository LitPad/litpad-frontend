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
  final int _totalPages = 5; // Assuming there are 5 pages in total

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
