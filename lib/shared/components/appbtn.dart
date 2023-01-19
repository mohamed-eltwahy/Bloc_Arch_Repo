import 'package:flutter/material.dart';

import '../appui.dart';

class AppButton extends StatelessWidget {
  final Function? onTap;
  final String? title;
  final Widget? titleWidget;
  final Color? color, titleColor;
  final double? width, hieght, fontSize ;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  const AppButton(
  this.title,
      {Key? key, this.onTap,
      this.color,
      this.titleColor = Colors.white,
      this.hieght,
      this.width,
      this.fontSize = 18.0,
      this.borderRadius,
      this.titleWidget, this.border }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        width: width ?? 100,
        height: hieght ?? 48,
        decoration: BoxDecoration(
          color: color??AppUI.maincolors ,
          border: border,
          borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        ),
        child: Center(
            child: title == null
                ? titleWidget
                : titleWidget ?? Text(
              title!,style: TextStyle(fontSize: fontSize ?? 12,
              fontWeight: FontWeight.w400,
              color: titleColor,),

            )),
      ),
    );
  }
}