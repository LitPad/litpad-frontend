import 'package:litpad/core/utils/utils.dart';
import 'package:litpad/ui/components/common/on_hover.dart';

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
      child: OnHoverScale(
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: width,
            height: (height ?? 44),
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
      child: OnHoverScale(
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: width,
            height: (height ?? 44),
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
      ),
    );
  }

  static Widget outline({
    Function()? onTap,
    bool online = true,
    required String text,
    bool isLoading = false,
    double? borderRadius,
    double? width,
    double? height,
    Color? offlineColor,
    Color? onlineColor,
    Color? bgColor,
  }) {
    return IgnorePointer(
      ignoring: !online,
      child: OnHoverScale(
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: width,
            height: (height ?? 44),
            // padding: padding ??
            //     EdgeInsets.symmetric(
            //       vertical: (14),
            //       horizontal: (10),
            //     ),
            decoration: online
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius ?? 30),
                    color: bgColor ?? AppColors.transparent,
                    border: Border.all(
                      color: onlineColor ?? AppColors.purple900,
                      width: 1,
                    ),
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius ?? 30),
                    color: bgColor ?? AppColors.transparent,
                    border: Border.all(
                      color: onlineColor ?? AppColors.purple900,
                      width: 1,
                    ),
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
                            ? AppColors.purple900
                            : AppColors.grey.withOpacity(0.5),
                      ),
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
    Color? bgColor,
    required Widget child,
  }) {
    return IgnorePointer(
      ignoring: !online,
      child: OnHoverScale(
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: width,
            height: (height ?? 44),
            decoration: online
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius ?? 30),
                    color: bgColor ?? AppColors.transparent,
                    border: Border.all(
                      color: onlineColor ?? AppColors.black,
                      width: 1,
                    ),
                  )
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius ?? 30),
                    color: bgColor ?? AppColors.transparent,
                    border: Border.all(
                      color: offlineColor ?? AppColors.grey,
                      width: 1,
                    ),
                  ),
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
