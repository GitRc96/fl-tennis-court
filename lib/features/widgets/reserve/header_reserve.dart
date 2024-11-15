import 'package:flutter/material.dart';

import '../shared/buttons/custom_icon_button.dart';

class HeaderReserve extends StatefulWidget {
  const HeaderReserve({
    super.key,
  });

  @override
  State<HeaderReserve> createState() => _HeaderReserveState();
}

class _HeaderReserveState extends State<HeaderReserve> {

  final List<String> imgList = [
    'assets/image/cancha1.png',
    'assets/image/cancha2.png',
    'assets/image/cancha3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        //Slide Image

        //
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(),
              InkWell(
                child: Center(
                  child: Icon(Icons.favorite_outline, color: Colors.white,),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}