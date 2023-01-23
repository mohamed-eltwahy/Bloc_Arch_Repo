import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppText extends AutoSizeText {
  AppText(String text,
      {Key? key,
        TextDecoration? textDecoration,
        Color? color,
        FontWeight? fontWeight,
        double? fontSize,
        double? height,
        int? maxLines,
        TextAlign? textAlign,
        TextOverflow? textOverflow})
      : super(
    text,
    key: key,
    overflow: textOverflow,
    style: TextStyle(
      color: color ??Colors.black,
      decoration: textDecoration ?? TextDecoration.none,
      fontWeight: fontWeight ?? FontWeight.w400,
      fontSize: fontSize ?? 15.sp,
      height: height ?? 1.5.h,
    ),
    textAlign: textAlign ?? TextAlign.center,
    maxLines: maxLines,
  );
}