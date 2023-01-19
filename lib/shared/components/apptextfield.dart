import 'package:flutter/material.dart';

import '../appui.dart';

class AppTextFormField extends TextFormField {
  AppTextFormField(
      {Key? key,
      String? hintText,
      bool? enabled,
      Function()? onTap,
      required BuildContext context,
      Color? suffixColor,
      Widget? suffixWidget,
      String? initialValue,
      TextEditingController? controller,
      String? Function(String?)? validator,
      bool? validateState,
      Widget? prefixIcon,
      IconData? suffixIcon,
      bool? readOnly,
      Function()? suffixIconOnTap,
      bool obscureText = false,
      Color? bordercolor,
      double? radius,
      // String? labelText,
      TextInputType? textInputType,
      int? maxLines = 1,
      int? minLines,
      Color? textColor,
      var inputFormatters,
      double? fontSize,
      double? suffixSize,
      bool? autoFocus,
      TextAlign? textAlign,
      void Function(String)? onChanged,
      onSubmitted})
      : super(
          key: key,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          initialValue: initialValue,
          onChanged: onChanged,
          enabled: enabled ?? true,
          // style: TextStyle( color:Colors.white),
          cursorColor: AppUI.secondColor,
          obscureText: obscureText,
          onTap: onTap,
          readOnly: readOnly ?? false,
          controller: controller,
          inputFormatters: inputFormatters,
          onFieldSubmitted: onSubmitted,
          // validator:validateState==false?null: validator??null,
          // (value){
          //    if(value!.isEmpty){
          //      return "fieldRequired".tr();
          //    }
          // },
          validator: validator,
          // validateState==null?null:(value){
          //    if(value!.isEmpty){
          //      return "fieldRequired".tr();
          //    }
          //    return null;
          // },
          minLines: minLines,
          maxLines: maxLines,
          autofocus: autoFocus ?? false,
          keyboardType: textInputType,
          // textAlign: AppUtil.isLtr(context)?TextAlign.left:TextAlign.right,
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            fillColor: Colors.white,

            filled: true,
            prefixIconColor: AppUI.secondColor,
            suffixIcon: suffixWidget ??
                IconButton(
                    onPressed: suffixIconOnTap,
                    icon: Icon(
                      suffixIcon,
                      color: suffixColor,
                      size: suffixSize,
                    )),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            errorStyle: const TextStyle(color: Colors.red, fontSize: 16),
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 5.0),
              borderSide: BorderSide(
                color: bordercolor ?? AppUI.secondColor,
                width: 2,
              ),
            ),

            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 5.0),
              borderSide:
                  BorderSide(color: bordercolor ?? Colors.grey, width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 5.0),
              borderSide:
                  BorderSide(color: bordercolor ?? AppUI.secondColor, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 5.0),
              borderSide:
                  BorderSide(color: bordercolor ?? AppUI.secondColor, width: 2),
            ),

            // labelText: labelText,
            // labelStyle: TextStyle(
            //   color: AppUI.greyColor,
            //   fontSize: fontSize ?? 12,
            // ),
          ),
        );
}
