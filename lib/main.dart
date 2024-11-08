import 'package:flutter/material.dart';

import 'presentation/screens/welcome/welcome_page.dart';

void main() => runApp(const TennisCourt());

class TennisCourt extends StatelessWidget {
  const TennisCourt({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Tennis Court',
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

