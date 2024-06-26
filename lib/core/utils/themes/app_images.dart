import 'package:flutter/material.dart';

const String images = "assets/images";

class AppImages {
  static const article = "$images/article.png";
  static const vline = "$images/vline.png";
  static const ig = "$images/ig.png";

  static const String trendbook = "$images/trendbook.png";
  static const String risingBook = "$images/risingBook.png";

  static const String coin = "$images/coin.png";
  static const String book = "$images/book.png";
  static const String prize = "$images/prize.png";
}

// Image Helper
Image imageHelper(String image, {double? height, double? width}) {
  return Image.asset(
    image,
    fit: BoxFit.cover,
    height: height,
    width: width,
  );
}
