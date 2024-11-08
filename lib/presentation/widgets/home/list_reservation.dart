import 'package:flutter/material.dart';

class ListReservation extends StatelessWidget {

  final String pathIamge;
  final String nameCourt;
  final String date;
  final String hours;
  final String price;

  const ListReservation({
    super.key,
    required this.pathIamge,
    required this.nameCourt,
    required this.date,
    required this.hours,
    required this.price, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 130,
        color: const Color(0xffF4F7FC),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Image
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage(pathIamge)
                  )
                ),
              ),
              const SizedBox(width: 10,),
      
              //Datails Reserve
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Name court
                  Text(
                    nameCourt,
                    style:  const TextStyle(
                    fontSize: 18,
                  ),),
                  const SizedBox(height: 3,),
      
                  //Calendar
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.calendar_today_outlined, size: 13,),
                      Text(' $date')
                    ],
                  ),
                  const SizedBox(height: 3,),
      
                  //Reserve by
                  Row(
                    children: [
                      const Text('Reservado por:'),
                      const SizedBox(width: 5,),
                      
                      //CircleAvatar
                      SizedBox(
                        height: 24,
                        width: 24,
                        child: CircleAvatar(
                          child: Image.asset('assets/image/avatar.png'),
                        ),
                      ),
                      const SizedBox(width: 5,),
                      const Text('Andrea Gómez')
                    ],
                  ),
      
                  //Hour
                  Row(
                    children: [
                      const Icon(
                      Icons.timer_outlined, size: 13,),
                      Text(' $hours Horas | \$$price'),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}