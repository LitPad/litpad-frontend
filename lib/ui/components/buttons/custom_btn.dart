import 'package:flutter/material.dart';
import 'package:litpad/core/utils/utils.dart';

class CustomBtn {
  static Widget solid({
    required Function()? onTap,
    required bool online,
    required String text,
    bool isLoading = false,
    double? borderRadius,
    double? width,
    double? height,
    Color? offlineColor,
    Color? onlineColor,
  }) {
    return IgnorePointer(
      ignoring: !online,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height ?? 44,
          decoration: online
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius ?? 30),
                  color: onlineColor ?? AppColors.primaryPurple,
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius ?? 30),
                  color: offlineColor ?? AppColors.grey,
                ),
          child: Center(
            child: isLoading
                ? const FittedBox(
                    child: CircularProgressIndicator(),
                  )
                : Text(
                    text,
                    style: AppTypography.text16.copyWith(
                      fontWeight: FontWeight.w500,
                      color: online
                          ? AppColors.white
                          : AppColors.grey.withOpacity(0.5),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  static Widget withChild({
    required Function()? onTap,
    required bool online,
    double? borderRadius,
    double? width,
    double? height,
    Color? offlineColor,
    Color? onlineColor,
    required Widget child,
  }) {
    return IgnorePointer(
      ignoring: !online,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height ?? 44,
          decoration: online
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius ?? 30),
                  color: onlineColor ?? AppColors.primaryPurple,
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius ?? 30),
                  color: offlineColor ?? AppColors.grey,
                ),
          child: Center(child: child),
        ),
      ),
    );
  }

  static Widget outline({
    required Function()? onTap,
    required bool online,
    required String text,
    bool isLoading = false,
    BorderRadiusGeometry? borderRadius,
    double? width,
    double? height,
    Color? offlineColor,
    Color? onlineColor,
  }) {
    return IgnorePointer(
      ignoring: !online,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height ?? 65,
          // padding: padding ??
          //     EdgeInsets.symmetric(
          //       vertical: Sizer.height(14),
          //       horizontal: Sizer.width(10),
          //     ),
          decoration: online
              ? BoxDecoration(
                  borderRadius: borderRadius,
                  color: onlineColor ?? AppColors.primaryPurple,
                )
              : BoxDecoration(
                  borderRadius: borderRadius,
                  color: offlineColor ?? AppColors.grey,
                ),
          child: Center(
            child: isLoading
                ? const FittedBox(
                    child: CircularProgressIndicator(),
                  )
                : Text(
                    text,
                    style: AppTypography.text16.copyWith(
                      fontWeight: FontWeight.w500,
                      color: online
                          ? AppColors.white
                          : AppColors.grey.withOpacity(0.5),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  static Widget outlineWithChild({
    required Function()? onTap,
    required bool online,
    double? borderRadius,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    Color? offlineColor,
    Color? onlineColor,
    required Widget child,
  }) {
    return IgnorePointer(
      ignoring: !online,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height ?? 44,
          decoration: online
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius ?? 30),
                  border: Border.all(
                    color: onlineColor ?? AppColors.black,
                    width: 1,
                  ),
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius ?? 30),
                  border: Border.all(
                    color: offlineColor ?? AppColors.grey,
                    width: 1,
                  ),
                ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
