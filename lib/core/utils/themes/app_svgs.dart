// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const String svgIcon = "assets/svgs";

class AppSvgs {
  static const String logo = "$svgIcon/logo.svg";
  static const String logoIcon = "$svgIcon/logoIcon.svg";
  static const String write = "$svgIcon/write.svg";
  static const String magnify = "$svgIcon/magnify.svg";
  static const String search = "$svgIcon/search.svg";
  static const String bookOpen = "$svgIcon/bookOpen.svg";

  // Socials
  static const String x = "$svgIcon/socials/x.svg";
  static const String fb = "$svgIcon/socials/fb.svg";
  static const String lk = "$svgIcon/socials/lk.svg";
  static const String google = "$svgIcon/socials/google.svg.svg";

  static const String muscle = "$svgIcon/muscle.svg";
  static const String people = "$svgIcon/people.svg";
  static const String rocket = "$svgIcon/rocket.svg";

  static const String copy1 = "$svgIcon/copy1.svg";
  static const String coins = "$svgIcon/coins.svg";
  static const String wallet = "$svgIcon/wallet.svg";
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
