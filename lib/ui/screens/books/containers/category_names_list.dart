import 'package:flutter/material.dart';
import 'package:litpad/core/utils/utils.dart';

class CategoryNameList extends StatefulWidget {
  const CategoryNameList({Key? key}) : super(key: key);

  @override
  State<CategoryNameList> createState() => _CategoryNameListState();
}

class _CategoryNameListState extends State<CategoryNameList> {
  String _selectedCategory = 'All';
  final _categories = [
    'All',
    'Business',
    'Entertainment',
    'General',
    'Health',
    'Science',
    'Sports',
    'Technology',
    'Poetry',
    'Music',
    'Art',
    'Literature',
    'History',
    'War',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 28,
      ),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: _categories
            .map(
              (category) => CatBtn(
                title: category,
                isActive: _selectedCategory == category,
                onTap: () {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}

class CatBtn extends StatelessWidget {
  const CatBtn({
    Key? key,
    required this.title,
    this.isActive = false,
    this.onTap,
  }) : super(key: key);

  final String title;
  final bool isActive;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: isActive ? AppColors.purple100 : AppColors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: isActive ? AppColors.purple800 : AppColors.grey300,
          ),
        ),
        child: Text(
          title,
          style: AppTypography.text15.copyWith(
            color: isActive ? AppColors.purple900 : AppColors.grey600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}