import 'package:flutter/material.dart';

import '../../../../../widgets/home/cards_court.dart';
import '../../../../../widgets/home/list_reservation.dart';
import '../../../../../widgets/shared/appbar/custom_appbar.dart';
import '../../../../../widgets/shared/navigationbar/custom_navigationbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //AppBar
          const CustomAppBar(),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: const [
                //Greeting
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    'Hola Andrea!',
                    style:  TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),),
                ),
                Divider(),
            
                //Section 1
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  child: Text(
                    'Canchas',
                    style:  TextStyle(
                      fontSize: 18,
                    ),),
                ),
                _ListCardsCourt(),
                Divider(),
                
                //Section 2
                Padding(
                  padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
                  child: Text(
                    'Reservas programadas',
                    style:  TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),),
                ),
                ListReservation(
                  pathIamge: 'assets/image/cancha2.png',
                  nameCourt:'Sport Box',
                  date:'6 de Julio 2024',
                  hours:'2',
                  price:'50'
                ),
                ListReservation(
                  pathIamge: 'assets/image/cancha3.png',
                  nameCourt:'Cancha multiple',
                  date:'29 de Agosto 2024',
                  hours:'2',
                  price:'80'
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomButtonNavigationBar(),
    );
  }
}

class _ListCardsCourt extends StatelessWidget {
  const _ListCardsCourt();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 365,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CardsCourt(
            pathImage: 'assets/image/cancha1.png',
            nameCourt: 'Epic Box',
            typeCourt: 'A',
            porcent: '30',
            date: '9 de Julio 2024',
            enable: true,
            hour: '7:00 am a 4:00 pm',
          ),
          CardsCourt(
            pathImage: 'assets/image/cancha2.png',
            nameCourt: 'Sport Box',
            typeCourt: 'C',
            porcent: '60',
            date: '10 de Julio 2024',
            enable: false,
          ),
          CardsCourt(
            pathImage: 'assets/image/cancha3.png',
            nameCourt: 'Cancha multiple',
            typeCourt: 'A',
            porcent: '30',
            date: '10 de Julio 2024',
            enable: true,
            hour: '7:00 am a 4:00 pm',
          ),
        ],
      ),
    );
  }
}
