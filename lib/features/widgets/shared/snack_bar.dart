  
import 'package:flutter/material.dart';

class CustomSnackBar {

  final BuildContext context;

  CustomSnackBar({required this.context});

  void snackBar(String text)  {
    final snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

}
