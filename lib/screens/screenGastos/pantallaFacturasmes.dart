// ignore_for_file: file_names

import 'package:desing_wallet/screens/screenGastos/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final bool mesActivo;
  final String mes;
  const HomeScreen({Key? key, required this.mesActivo, required this.mes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff141414),
      appBar: CustomAppBar(height: size.height, mes: mes),
      body: Center(
        child: Text('HomeScreen $mesActivo'),
      ),
    );
  }
}
