import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/home/cards_court.dart';
import '../../../../../widgets/home/list_reservation.dart';
import '../../../../../widgets/shared/appbar/custom_appbar.dart';
import '../../../../../widgets/shared/navigationbar/custom_navigationbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final _user = FirebaseAuth.instance.currentUser; 

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //AppBar
          const CustomAppBar(),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(0),
              children: [
                //Greeting
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: Text(
                    'Hola ${_user?.email ?? 'Andreina'}!',
                    style:  const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),),
                ),
                const Divider(),
            
                //Section 1
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
                  child: Text(
                    'Canchas',
                    style:  TextStyle(
                      fontSize: 18,
                    ),),
                ),
                const _ListCardsCourt(),
                const Divider(),
                
                //Section 2
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10, bottom: 5),
                  child: Text(
                    'Reservas programadas',
                    style:  TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    ),),
                ),
                const ListReservation(
                  pathIamge: 'assets/image/cancha2.png',
                  nameCourt:'Sport Box',
                  date:'6 de Julio 2024',
                  hours:'2',
                  price:'50'
                ),
                const ListReservation(
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
