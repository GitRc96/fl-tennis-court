import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../widgets/reserve/header_reserve.dart';

const List<String> list = <String>['Agregar instructor', 'Carlos Ruiz', 'Mateo Sanz', 'Paul Walker'];
class ReservePage extends StatefulWidget {
  const ReservePage({super.key});

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          //Header
          const HeaderReserve(),
          const SizedBox(height: 24,),
          
          //Details Court
          const _DetailsCourt(),

          //Form
          Expanded(child: Container(
            width: double.infinity,
            color: const Color(0xFFF4F7FC),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text('Establecer fecha y hora'),
                  SizedBox(height: 20,),

                  //Date
                  _DatePicker()
                ],
              ),
            ),
          ))

        ],
      ),
    );
  }
}

class _DatePicker extends StatefulWidget {
  const _DatePicker({
    super.key,
  });

  @override
  State<_DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<_DatePicker> {

  String? _date = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12)
      ),
      child: InkWell(
        onTap: () async {
          DateTime? valueDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2100),
          );
          
          if (valueDate != null) {
            setState(() {
              _date = DateFormat('dd-MM-yyyy').format(valueDate);
            });
          }
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Tittle
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Fecha'),
                Text('$_date'),
              ],
            ),
            Expanded(child: Container()),
            const Center(
              child: Icon(Icons.keyboard_arrow_down),
            )
          ],
        ),
      ),
    );
  }
}

class _DetailsCourt extends StatelessWidget {
  const _DetailsCourt();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          const _TittleCard('Epic Box', '25'),
          const SizedBox(height: 5,),
    
          //Type court
          const Text('Cancha tipo A'),
          const SizedBox(height: 10,),
    
          //Hour
          Row(
            children: [
              const Text('Disponible'),
              const SizedBox(width: 10,),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color(0xff346BC3)
                ),
              ),
              const SizedBox(width: 5,),
              if (true)
              const Icon(
                Icons.timer_outlined, size: 13,),
              const Text('7:00 am a 4:00 pm'),
              Expanded(child: Container()),
    
              //Climate icon
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset('assets/image/rainy.png'),
                ),
            
                //Porcent
                const Text(
                  '  30%',
                  style:  TextStyle(
                  fontSize: 12,
                ),),
    
            ],
          ),
          const SizedBox(height: 10,),

          //Direction
          const Row(
            children: [
              Icon(
              Icons.location_on_outlined, size: 13,),
              Text('Vía Av. Caracas y Av. P.° Caroni'),
            ],
          ),
          const SizedBox(height: 15,),
        
          //List instructor
          const _ListInstructor(),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}

class _ListInstructor extends StatefulWidget {
  const _ListInstructor();

  @override
  State<_ListInstructor> createState() => _ListInstructorState();
}

class _ListInstructorState extends State<_ListInstructor> {

  String dropDownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 170,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all()
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: dropDownValue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(), 
          onChanged: (String? value) => setState(() {
            dropDownValue = value!;
          }),
        ),
      )
    );
  }
}

class _TittleCard extends StatelessWidget {

  final String nameCourt;
  final String price;  

  const _TittleCard(this.nameCourt, this.price);

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
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),),
        Expanded(child: Container()),
    
        //Price
        Text(
          '\$$price',
          style:  const TextStyle(
          fontSize: 22,
          color: Color(0xFF346BC3),
          fontWeight: FontWeight.bold
        ),),
      ],
    );
  }
}