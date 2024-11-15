import 'package:flutter/material.dart';

class CustomInputs {

  static InputDecoration loginInputDecoration({
    final String? hintInput,
    final IconData? iconInput,
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide.none
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide.none
      ),
      hintText: hintInput,
      hintStyle: const TextStyle(color:Color(0xff9B9C9D)),
      icon: Container(
        padding: const EdgeInsets.only(right: 8, left: 8),
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(color: Color(0xff3D3D3D))
          )
        ),
        child: Icon(
          iconInput,
          color: const Color(0xff3D3D3D),)),
    );
  }

  static InputDecoration passwordInputDecoration({
    final String? hintInput,
    final IconData? iconInput,
  }) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide.none
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide.none
      ),
      hintText: hintInput,
      hintStyle: const TextStyle(color:Color(0xff9B9C9D)),
      icon: Container(
        padding: const EdgeInsets.only(right: 8, left: 8),
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(color: Color(0xff3D3D3D))
          )
        ),
        child: Icon(
          iconInput,
          color: const Color(0xff3D3D3D),)),
        suffixIcon: const Icon(
          Icons.visibility_outlined,
          color: Color(0xff3D3D3D),)
    );
  }

}
