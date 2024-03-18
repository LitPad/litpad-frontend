import 'package:flutter/material.dart';

class CustomPagination extends StatelessWidget {
  const CustomPagination({
    Key? key,
    required this.currentPage,
    required this.totalPages,
    this.onPageChanged,
    this.pageButtonColor,
    this.pageButtonTextColor,
    this.buttonTextStyle,
  }) : super(key: key);

  final int currentPage;
  final int totalPages;
  final ValueChanged<int>? onPageChanged;
  final Color? pageButtonColor;
  final Color? pageButtonTextColor;
  final TextStyle? buttonTextStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _prevBtn(),
        const SizedBox(width: 16),
        for (int pageNumber = 1; pageNumber <= totalPages; pageNumber++)
          _buildPageButton(context, pageNumber),
        const SizedBox(width: 16),
        _nextBtn(),
      ],
    );
  }

  Widget _buildPageButton(BuildContext context, int pageNumber) {
    return InkWell(
      onTap: () {
        if (onPageChanged != null) {
          onPageChanged!(pageNumber);
        }
      },
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: currentPage == pageNumber
              ? pageButtonColor ?? Colors.grey[900]
              : null,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          pageNumber.toString(),
          style: TextStyle(
            color: currentPage == pageNumber
                ? Colors.white
                : pageButtonTextColor ?? Colors.black,
            fontSize: 14,
          ).merge(buttonTextStyle),
        ),
      ),
    );
  }

  Widget _prevBtn() {
    return InkWell(
      onTap: () {
        if (onPageChanged != null && currentPage > 1) {
          onPageChanged!(currentPage - 1);
        }
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.arrow_left,
            color: Colors.black87,
            size: 20,
          ),
          SizedBox(width: 6),
          Text(
            "Previous",
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _nextBtn() {
    return InkWell(
      onTap: () {
        if (onPageChanged != null && currentPage < totalPages) {
          onPageChanged!(currentPage + 1);
        }
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Next",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(width: 6),
          Icon(
            Icons.arrow_right,
            color: Colors.black87,
            size: 20,
          ),
        ],
      ),
    );
  }
}
