import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/utils/styles/styles.dart';
import 'global_text.dart';

class GlobalTextFormField extends StatelessWidget {
  final bool? obscureText;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final int? maxlength;
  final AutovalidateMode? autovalidateMode;
  final bool? readOnly;
  final Color? fillColor;
  final String? hintText;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool? mandatoryLabel;
  final TextStyle? style;
  final int? line;
  final String? initialValue;
  final TextInputAction? textInputAction;
  final Function(String)? onChanged;

  const GlobalTextFormField({
    Key? key,
    this.obscureText,
    this.textInputType,
    this.controller,
    this.validator,
    this.fillColor,
    this.suffixIcon,
    this.prefixIcon,
    this.maxlength,
    this.initialValue,
    this.autovalidateMode,
    this.readOnly,
    this.hintText,
    this.labelText,
    this.hintStyle,
    this.mandatoryLabel,
    this.labelStyle,
    this.line = 1,
    this.style,
    this.onChanged,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: line,
      style: style ?? KTextStyle.customTextStyle(),
      autovalidateMode: autovalidateMode,
      obscureText: obscureText ?? false,
      obscuringCharacter: '*',
      controller: controller,
      textInputAction: textInputAction,
      cursorColor: KColor.grayMedium.color,
      keyboardType: textInputType ?? TextInputType.text,
      onChanged: onChanged,
      maxLength: maxlength,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          top: 24.h,
          bottom: 24.h,
          left: 14.w,
        ),
        prefixIcon: prefixIcon,

        hintText: hintText,
        label: mandatoryLabel == true
            ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GlobalText(
                    str: labelText ?? "",
                    style: KTextStyle.customTextStyle(),
                  ),
                  const GlobalText(
                    str: '*',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              )
            : GlobalText(
                str: labelText ?? "",
                style: KTextStyle.customTextStyle(),
              ),
        // labelText: labelText,
        labelStyle: labelStyle,
        filled: true,
        counterText: "",

        fillColor: KColor.grayLight.color,
        suffixIcon: suffixIcon,
        hintStyle: hintStyle ?? KTextStyle.customTextStyle(fontSize: 13.sp),
        border:  OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: KColor.primary.color, width: 1.w),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: KColor.primary.color, width: 1.w),
          borderRadius: BorderRadius.all(
            Radius.circular(
              8.r,
            ),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: KColor.primary.color, width: 1.w),
          borderRadius: BorderRadius.all(
            Radius.circular(
              8.r,
            ),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: const Color(0xffE0E0E0), width: 1.w),
        ),
      ),
      validator: validator,
      readOnly: readOnly ?? false,
    );
  }
}
 