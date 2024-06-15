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
    TextStyle? textStyle,
    Widget? icon,
    Alignment iconAlignment = Alignment.centerLeft,
  }) {
    return IgnorePointer(
      ignoring: !online,
      child: OnHoverTranslate(
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(
              vertical: 13,
              horizontal: 26,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius ?? 30),
              color: online
                  ? (onlineColor ?? AppColors.primaryPurple)
                  : (offlineColor ?? AppColors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Container(
                    color: textStyle?.color ?? AppColors.white,
                    child: icon,
                  ),
                if (icon != null)
                  const XBox(15),
                Center(
                  child: isLoading
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              textStyle?.color ?? Colors.white),
                        )
                      : Text(
                          text,
                          style: textStyle ??
                              AppTypography.text14.copyWith(
                                fontWeight: FontWeight.w500,
                                color: online
                                    ? Colors.white
                                    : AppColors.grey.withOpacity(0.5),
                              ),
                          textAlign: TextAlign.center,
                        ),
                ),
              ],
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
          borderRadius: BorderRadius.circular(borderRadius ?? 30),
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
