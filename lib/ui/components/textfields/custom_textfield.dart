import 'package:litpad/core/utils/utils.dart';

class CustomTextField extends StatefulWidget {
  final String? errorText, labelText, hintText, optionalText;
  final TextEditingController? controller;
  final Function? onChange;
  final bool? isPassword, isConfirmPassword, showSuffixIcon;
  final Widget? suffixIcon, prefix, prefixIcon;
  final KeyboardType keyboardType;
  final double? width, height, labelSize;
  final double borderRadius;
  final bool? isReadOnly;
  final FocusNode? focusNode;
  final bool showLabelHeader, hideBorder;
  final Color? labelColor;
  final Color? fillColor;
  final bool isOptional;
  final Function()? onTap;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.hintText,
    this.optionalText,
    this.labelColor,
    this.fillColor = Colors.transparent,
    this.labelSize,
    this.controller,
    this.isPassword = false,
    this.isConfirmPassword = false,
    this.showSuffixIcon = false,
    this.hideBorder = false,
    this.suffixIcon,
    this.prefix,
    this.prefixIcon,
    this.errorText,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.isReadOnly = false,
    this.keyboardType = KeyboardType.regular,
    this.showLabelHeader = false,
    this.focusNode,
    this.isOptional = false,
    this.onChange,
    this.onTap,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    // List<KeyboardType> numsKeyboardType = [
    //   KeyboardType.decimal,
    //   KeyboardType.number,
    //   KeyboardType.accountNo,
    //   KeyboardType.bvn
    // ];
    // // KeyboardOverlay.showOverlay(context);
    // if (widget.focusNode != null &&
    //     numsKeyboardType.contains(widget.keyboardType)) {
    //   KeyboardOverlay.addRemoveFocusNode(context, widget.focusNode!);
    // }
  }

  @override
  void dispose() {
    // Clean up the focus node
    super.dispose();
    // if (widget.focusNode != null && mounted) {
    //   widget.focusNode?.dispose();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        widget.showLabelHeader
            ? Column(
                children: [
                  Row(
                    children: [
                      Text(widget.labelText!,
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: widget.labelSize ?? 12,
                            fontWeight: FontWeight.w400,
                          )),
                      Text(
                          widget.optionalText != null
                              ? widget.optionalText!
                              : widget.isOptional
                                  ? " (Optional)"
                                  : "",
                          style: TextStyle(
                            color: AppColors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: widget.labelSize ?? 15,
                          )),
                    ],
                  ),
                  const YBox(4),
                ],
              )
            : const SizedBox(),
        Container(
          width: widget.width ?? double.infinity,
          height: widget.height ?? 48,
          alignment: Alignment.center,
          // color: Colors.red,
          child: TextField(
            // cursorHeight: 14.sp,
            cursorColor: AppColors.black,
            focusNode: widget.focusNode,
            style: const TextStyle(
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400),
            controller: widget.controller,
            obscureText: widget.isPassword! && !showPassword,
            // keyboardType: inputType(widget.keyboardType),
            // inputFormatters: inputFormatter(widget.keyboardType),
            onChanged: (String value) {
              if (widget.onChange != null) {
                widget.onChange!();
              }
            },
            onTap: widget.onTap,
            readOnly: widget.isReadOnly!,
            decoration: InputDecoration(
              errorText: widget.errorText,
              errorStyle: const TextStyle(
                  color: AppColors.red, fontSize: 0.01, height: 0.2),
              // contentPadding: EdgeInsets.only(
              //   top: 30.h,
              //   bottom: 0.h,
              //   left: 16.w,
              // ),
              // labelText: widget.labelText,
              hintText: widget.hintText,
              hintStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: AppColors.grey,
              ),
              suffixIcon: suffixIcon(),
              prefix: widget.prefix,
              prefixIcon: widget.prefixIcon,
              // suffixIconColor: AppColors.brandOrange,

              fillColor: widget.fillColor,
              filled: true,
              // isCollapsed: true,
              // isDense: true,
              // labelStyle: TextStyle(color: bluishGrey, fontSize: 14.sp),
              enabledBorder: OutlineInputBorder(
                borderSide: widget.hideBorder
                    ? BorderSide.none
                    : const BorderSide(
                        width: 1,
                        color: AppColors.grey300,
                      ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: widget.hideBorder
                    ? BorderSide.none
                    : const BorderSide(
                        width: 1,
                      ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              border: OutlineInputBorder(
                borderSide: widget.hideBorder
                    ? BorderSide.none
                    : const BorderSide(
                        width: 1,
                        color: AppColors.grey300,
                      ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              errorBorder: OutlineInputBorder(
                //borderSide: BorderSide.none,
                borderSide: widget.hideBorder
                    ? BorderSide.none
                    : BorderSide(
                        width: 1, color: AppColors.red.withOpacity(0.8)),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: widget.hideBorder
                    ? BorderSide.none
                    : BorderSide(
                        width: 1, color: AppColors.red.withOpacity(0.8)),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: widget.hideBorder
                    ? BorderSide.none
                    : const BorderSide(
                        width: 1,
                        color: AppColors.grey300,
                      ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
            ),
          ),
        ),
        widget.errorText == null
            ? const SizedBox.shrink()
            : Text(
                widget.errorText ?? "",
                style: TextStyle(
                    color: AppColors.red.withOpacity(0.8), fontSize: 12),
              )
      ],
    );
  }

  Widget? suffixIcon() {
    if (widget.isPassword! && !widget.isConfirmPassword!) {
      return GestureDetector(
          onTap: () => setState(() {
                showPassword = !showPassword;
              }),
          child: PasswordSuffixWidget(
            showPassword: showPassword,
          ));
    }
    if (widget.showSuffixIcon! && widget.suffixIcon == null) {
      // return const Icon(
      //   Iconsax.arrow_down,
      //   size: 18,
      //   color: AppColors.black,
      // );
    }

    if (widget.showSuffixIcon! && widget.suffixIcon != null) {
      //return const Icon(FontAwesomeIcons.circleCheck, size: 16, color: green);
      return widget.suffixIcon;
    }
    return null;
  }
}

class PasswordSuffixWidget extends StatelessWidget {
  final bool showPassword;
  const PasswordSuffixWidget({super.key, required this.showPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 26,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(
        top: 11,
        bottom: 11,
      ),
      decoration: BoxDecoration(
        // color: AppColors.black,
        borderRadius: BorderRadius.circular(4),
      ),
      // child: showPassword
      //     ? const Icon(
      //         Iconsax.eye_slash5,
      //         size: 24,
      //         color: AppColors.black,
      //       )
      //     : const Icon(
      //         Iconsax.eye4,
      //         size: 24,
      //         color: AppColors.black,
      //       ),
    );
  }
}
