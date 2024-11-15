import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {

  final double width;
  final double heigth;
  final Color color;
  final double opacity;
  final String text;
  final Color colorText;
  final Function onPressed;
  final double borderRadius;

  const CustomElevatedButton({
    super.key,
    required this.width,
    required this.heigth,
    this.color =  const Color(0xff82BC00),
    this.opacity = 1,
    required this.text,
    this.colorText = const Color(0xffFCFCFC), 
    required this.onPressed, 
    this.borderRadius = 12.0, 
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width,
      height: heigth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
          backgroundColor: color.withOpacity(opacity)
        ),
        onPressed: () => onPressed(), 
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: colorText,
            fontWeight: FontWeight.w600,
          ),
        )
      ),
    );
  }
}