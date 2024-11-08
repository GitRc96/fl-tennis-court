import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xff82BC00),
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.white,),
        ),
      ),
    );
  }
}