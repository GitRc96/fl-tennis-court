import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage('assets/image/background.png'),
          fit: BoxFit.cover)
      ),
    );
  }
}