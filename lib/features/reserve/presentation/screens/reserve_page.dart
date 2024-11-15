import 'package:flutter/material.dart';

import '../../../widgets/reserve/header_reserve.dart';

class ReservePage extends StatefulWidget {
  const ReservePage({super.key});

  @override
  State<ReservePage> createState() => _ReservePageState();
}

class _ReservePageState extends State<ReservePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [

          //Header
          HeaderReserve()
        ],
      ),
    );
  }
}