// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String svgIcon = "assets/svgs";

class AppSvgs {
  static const String logo = "$svgIcon/logo.svg";
  static const String write = "$svgIcon/write.svg";
  static const String magnify = "$svgIcon/magnify.svg";
  static const String search = "$svgIcon/search.svg";
  static const String bookOpen = "$svgIcon/bookOpen.svg";

  static const String x = "$svgIcon/x.svg";
  static const String fb = "$svgIcon/fb.svg";
  static const String lk = "$svgIcon/lk.svg";

  static const String muscle = "$svgIcon/muscle.svg";
  static const String people = "$svgIcon/people.svg";
  static const String rocket = "$svgIcon/rocket.svg";
}

SvgPicture svgHelper(String svg,
    {double? height, double? width, Color? color}) {
  return SvgPicture.asset(
    svg,
    fit: BoxFit.cover,
    height: height,
    width: width,
    color: color,
  );
}
