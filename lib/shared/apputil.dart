import 'package:flutter/material.dart';

class AppUtill {
  // static Uri setApi(String endPoint) {
  //   return Uri.parse("https://615d4dea12571a001720752d.mockapi.io/$endPoint");
  // }

  static navigatTo(context, screen) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => screen));

      
  static navigatToAndFinish(context, screen) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => screen),
      (route) => false);
}
