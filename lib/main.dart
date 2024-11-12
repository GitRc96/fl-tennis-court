import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tennis_court_app/firebase_options.dart';

import 'presentation/screens/welcome/welcome_page.dart';

Future <void> main() async{

  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const TennisCourt());
}

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

