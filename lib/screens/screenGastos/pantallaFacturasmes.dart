// ignore_for_file: file_names

import 'package:desing_wallet/screens/screenGastos/widgets/CustomAppBar.dart';
import 'package:desing_wallet/screens/screenGastos/widgets/cuerpoList.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../Services/sharedpreferences.dart';
import '../screenPrincipal/types.dart';

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
      body: Stack(
        children: [
          const SlideAnimation2(),
          Container(
            height: size.height * 0.28,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color(0xff17191F).withOpacity(0.6),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  containerTop(size),
                  containerAdd(size),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

// ! contenedor elevatedboton agregar
  Container containerAdd(Size size) {
    return Container(
      margin:
          EdgeInsets.only(top: size.height * 0.02, bottom: size.height * 0.01),
      //height: 100,
      width: size.width,
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Color(0xff17191F),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: size.width * 0.1,
                    child: Image.asset("assets/2.png")),
              ),
              Text(
                "FuckApp control",
                style: ETypes().styleSueldo,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff141414)),
                  onPressed: !mesActivo
                      ? null
                      : () {
                          debugPrint("Activo");
                        },
                  child: Text(
                    "+ Agregar datos de nueva factura",
                    style: ETypes().styleSueldo,
                  )),
            ],
          )
        ],
      ),
    );
  }

//! COntenedor principal
  Container containerTop(Size size) {
    return Container(
      padding: EdgeInsets.all(size.width * 0.02),
      width: size.width - 10,
      decoration: const BoxDecoration(
        color: Color(0xff17191F),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          LinearPercentIndicator(
            width: size.width - 50,
            animation: true,
            animationDuration: 1500,
            lineHeight: 10.0,
            percent: 0.0,
            backgroundColor: Colors.grey,
            progressColor: Colors.red,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "  Gastos: \$0 de \$${cantidad(UserPreferences.sueldo)}",
                style: ETypes().stylesaux,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String cantidad(String s) {
    int sl = int.parse(s);
    var fac = sl * 0.30;
    return fac.toString() + "0";
  }
}
