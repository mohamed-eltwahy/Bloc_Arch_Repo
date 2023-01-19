import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


   flutterToast(BuildContext context, String msg, String typee, {double? fontSize, bool cancel = false,bool red =false}) async{
  try{
    Toast toastLength = Toast.LENGTH_LONG;
    ToastGravity gravity;
    Color backgroundColor;
    double fontSize = 12.0;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if(width <= 330.0){
      fontSize = 14.0;
    } else if(width <= 410.0){
      fontSize = 14.0;
    } else if(width <= 576.0){
      fontSize = 14.0;
    } else if(width <= 768.0){
      if(width > height){
        fontSize = 14.0;
      } else{
        fontSize = 18.0;
      }
    } else if(width <= 992.0){
      fontSize = 18.0;
    } else if(width <= 1550.0){
      fontSize = 18.0;
    } else{
      fontSize = 14.0;
    }    
    if(typee == 'error'){
      gravity = ToastGravity.BOTTOM;
      backgroundColor = Colors.red;
      // toastLength = Toast.LENGTH_LONG;
    } else if(typee == 'success'){
      gravity = ToastGravity.BOTTOM;
      backgroundColor = Colors.green;
      toastLength = Toast.LENGTH_LONG;
    }
    if(cancel){
      await Fluttertoast.cancel();
    }
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength,
      gravity: ToastGravity.TOP,
      //timeInSecForIos: 3,
      backgroundColor: typee == 'error'?Colors.red:Colors.green,
      textColor: Colors.white,
      fontSize: fontSize
    );
  } catch(err){
    log('myToast err : $err');
  }
}