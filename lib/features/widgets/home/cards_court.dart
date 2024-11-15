import 'package:flutter/material.dart';

import '../shared/buttons/customs_elevated_buttons.dart';

class CardsCourt extends StatelessWidget {

  final String pathImage;
  final String nameCourt;
  final String typeCourt;
  final String porcent;
  final String date;
  final bool enable;
  final String? hour;

  const CardsCourt({
    super.key,
    required this.pathImage,
    required this.typeCourt,
    required this.porcent,
    required this.date,
    required this.enable,
    this.hour, 
    required this.nameCourt,
  });

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromARGB(255, 202, 201, 201)
        )
      );

    return Container(
      height: 365,
      width: 285,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: boxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image Header
          _ImageCourt(pathImage),

          Padding(
            padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title cards
                _TittleCard(
                  nameCourt,
                  porcent
                ),
                const SizedBox(height: 5,),

                //Type court
                Text('Cancha tipo $typeCourt'),
                const SizedBox(height: 5,),

                //Calendar
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today_outlined, size: 13,),

                    Text(date)
                  ],
                ),
                const SizedBox(height: 5,),

                //Hour
                Row(
                  children: [
                    Text((enable)?'Disponible':'No disponible'),
                    const SizedBox(width: 10,),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: (enable)
                        ?const Color(0xff346BC3)
                        : Colors.grey
                      ),
                    ),
                    const SizedBox(width: 5,),
                    if (enable)
                    const Icon(
                      Icons.timer_outlined, size: 13,),
                    Text(hour??'')
                  ],
                ),
                const SizedBox(height: 30,),

                //Reserve Button
                Center(
                  child: CustomElevatedButton(
                    width: 144,
                    heigth: 32,
                    borderRadius: 4.0,
                    text: 'Reservar',
                    color: (enable)
                    ? const Color(0xff82BC00)
                    : Colors.grey,
                    onPressed: (){},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _TittleCard extends StatelessWidget {

  final String nameCourt;
  final String porcent;  

  const _TittleCard(this.nameCourt, this.porcent);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //Name court
        Text(
          nameCourt,
          style:  const TextStyle(
          fontSize: 18,
        ),),
        Expanded(child: Container()),
    
        //Climate icon
        SizedBox(
          height: 24,
          width: 24,
          child: Image.asset('assets/image/rainy.png'),
        ),
    
        //Porcent
        Text(
          '  $porcent%',
          style:  const TextStyle(
          fontSize: 12,
        ),),
      ],
    );
  }
}

class _ImageCourt extends StatelessWidget {

  final String pathImage;

  const _ImageCourt(this.pathImage);

  @override
  Widget build(BuildContext context) {

    var decorationImage = DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage(pathImage));

    return Container(
      height: 157,
      decoration: BoxDecoration(
        image: decorationImage,
        borderRadius: BorderRadius.circular(12)
      ),
    );
  }
}