import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class CustomSnackbarWidget extends StatelessWidget {
  final bool isSuccess;
  final String message;

  const CustomSnackbarWidget(
      {super.key, required this.isSuccess, required this.message});

  @override
  Widget build(BuildContext context) {
    final Color color = isSuccess ? Colors.green : Colors.red;
    final Alignment alignment =
        isSuccess ? Alignment.bottomCenter : Alignment.topCenter;

    return Container(
      alignment: alignment,
      child: AwesomeSnackbarContent(
        color: color,
        title: 'Oh Hey!!',
        message: message,
        contentType: isSuccess ? ContentType.success : ContentType.failure,
        inMaterialBanner: true,
      ),
    );
  }
}
