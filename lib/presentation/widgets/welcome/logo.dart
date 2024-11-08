import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 209,
      height: 148,
      margin: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/image/logo.png')
        )
      ),
    );
  }
}