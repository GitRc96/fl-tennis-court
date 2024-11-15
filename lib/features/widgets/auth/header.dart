import 'package:flutter/material.dart';

import '../shared/buttons/custom_icon_button.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/image/header.png'),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: CustomIconButton() 
        ),
      ],
    );
  }
}