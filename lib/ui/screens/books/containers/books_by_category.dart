import 'package:flutter/material.dart';
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
          const SizedBox(height: 40),
          GridView.count(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.1,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 30,
            childAspectRatio: 580 / 234,
            children: [
              BookCard(
                onImageTap: () {
                  context.goNamed(RoutePath.bookDetailsScreen, pathParameters: {
                    'id': '1',
                  });
                },
              ),
              BookCard(
                onImageTap: () {
                  context.goNamed(RoutePath.bookDetailsScreen, pathParameters: {
                    'id': '1',
                  });
                },
              ),
              BookCard(
                onImageTap: () {
                  context.goNamed(RoutePath.bookDetailsScreen, pathParameters: {
                    'id': '1',
                  });
                },
              ),
              BookCard(
                onImageTap: () {
                  context.goNamed(RoutePath.bookDetailsScreen, pathParameters: {
                    'id': '1',
                  });
                },
              ),
              BookCard(
                onImageTap: () {
                  context.goNamed(RoutePath.bookDetailsScreen, pathParameters: {
                    'id': '1',
                  });
                },
              ),
              BookCard(
                onImageTap: () {
                  context.goNamed(RoutePath.bookDetailsScreen, pathParameters: {
                    'id': '1',
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
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
