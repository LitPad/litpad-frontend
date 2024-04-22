import 'package:flutter/material.dart';
import 'package:litpad/core/utils/themes/app_colors.dart';

class XBox extends StatelessWidget {
  final double _width;

  const XBox(this._width, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width,
    );
  }
}

///Use for height spacing
class YBox extends StatelessWidget {
  final double _height;

  const YBox(this._height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
    );
  }
}

///Use for when divider is needed
class AppDivider extends StatelessWidget {
  const AppDivider({this.color, this.thickness, Key? key}) : super(key: key);

  final Color? color;
  final double? thickness;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color ?? AppColors.grey,
      height: 0,
      thickness: thickness,
    );
  }
}
