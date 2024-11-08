import 'package:flutter/material.dart';

import '../labes/custom_label.dart';

class TextFieldInput extends StatelessWidget {

  final String tittleInput;
  final bool obscureText;
  final InputDecoration inputDecoration;

  const TextFieldInput({
    super.key,
    required this.tittleInput,
    this.obscureText = false, 
    required this.inputDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 312,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color:Color(0xff3D3D3D),
            )
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(tittleInput, style: CustomLabels.tittleInput,),
            ),
            TextFormField(
              onChanged: (value){},
              obscureText: obscureText,
              obscuringCharacter: '*',
              decoration: inputDecoration
            ),
          ],
        ),
      ),
    );
  }
}