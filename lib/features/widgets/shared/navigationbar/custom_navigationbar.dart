import 'package:flutter/material.dart';

class CustomButtonNavigationBar extends StatelessWidget {
  const CustomButtonNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.8),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12))
      );

    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 30),
      decoration: boxDecoration,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ButtonNav(
            colorButton: Color(0xff82BC00),
            icon: Icons.home,
            iconColor: Colors.white,
            text: 'Inicio',
            textColor: Colors.white,
          ),
          _ButtonNav(
            colorButton: Colors.white,
            icon: Icons.calendar_month_outlined,
            iconColor: Colors.black,
            text: 'Reservar',
            textColor: Colors.black,
          ),
          _ButtonNav(
            colorButton: Colors.white,
            icon: Icons.favorite_border,
            iconColor: Colors.black,
            text: 'Favoritos',
            textColor: Colors.black,
          )
        ],
      ),
    );
  }
}

class _ButtonNav extends StatelessWidget {

  final Color colorButton;
  final IconData icon;
  final Color iconColor;
  final String text;
  final Color textColor;

  const _ButtonNav({
    required this.colorButton,
    required this.icon,
    required this.text, 
    required this.iconColor, 
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: colorButton,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor,),
          Text(text, style: TextStyle(color: textColor),)
        ],
      ),
    );
  }
}