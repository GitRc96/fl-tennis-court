import 'package:flutter/material.dart';

import 'custom_label.dart';

class TittlePage extends StatelessWidget {

  final String text;

  const TittlePage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text, style: CustomLabels.tittlePage),
          const SizedBox(
            width: 80,
            child: Divider(
              color: Color(0xff346BC3),
              height: 2,
            ),
          )
        ],
      ),
    );
  }
}