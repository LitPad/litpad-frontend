
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import '../../../../core/utils/constants/constants.dart';
import '../../../../core/utils/themes/app_colors.dart';

class CarouselContainer extends StatefulWidget {
  const CarouselContainer({super.key});

  @override
  _CarouselContainerState createState() => _CarouselContainerState();
}

class _CarouselContainerState extends State<CarouselContainer> {
  int _currentIndex = 0;
  final List<String> imgList = [
    'assets/images/article.png',
    'assets/images/bookImage.jpg',
    'assets/images/bookImage3.png',
    'assets/images/bookImage2.png',
    'assets/images/bookImage4.png',
    'assets/images/bookImage5.png'
  ];

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;
    double containerHeight;
    double containerWidth;
    double fontSize;
    double imageHeight;
    double viewportFraction;
    EdgeInsets padding;
    EdgeInsets margin;
    double sizedBoxHeight;

    if (screenWidth < ScreenSize.mobile) {
      containerHeight = 300;
      containerWidth = screenWidth * 0.8;
      fontSize = 16;
      imageHeight = 400;
      viewportFraction = 0.55;
      padding = const  EdgeInsets.symmetric(horizontal: 10);
      sizedBoxHeight = 5;
      margin =  const EdgeInsets.only(top: 10, bottom: 20);
    } else if (screenWidth < ScreenSize.tablet) {
      containerHeight = 400;
      containerWidth = screenWidth * 0.7;
      fontSize = 20;
      imageHeight = 400;
      viewportFraction = 0.55;
      padding = const EdgeInsets.symmetric(horizontal: 20);
      sizedBoxHeight = 5;
      margin =  const EdgeInsets.only(top: 10, bottom: 20);

    } else {
      containerHeight = 530;
      containerWidth = 450;
      fontSize = 24;
      imageHeight = 400;
      viewportFraction = 0.55;
      padding = const EdgeInsets.symmetric(horizontal: 30);
      sizedBoxHeight = 30;
      margin =  const EdgeInsets.only(top: 10, bottom: 10);

    }

    return Container(
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        image: DecorationImage(
          image: AssetImage(imgList[_currentIndex]),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            // padding: padding,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                 SizedBox(height: sizedBoxHeight),
                Text(
                  'Weekly Features',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  margin:margin,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: viewportFraction,
                      enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      height: imageHeight,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      aspectRatio: 12 / 9,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: imgList
                        .map((item) => ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        item,
                        fit: BoxFit.contain,
                      ),
                    ))
                        .toList(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: AppColors.purple100,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: imgList.map((url) {
                      int index = imgList.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? AppColors.purple800
                              : AppColors.purple400,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

