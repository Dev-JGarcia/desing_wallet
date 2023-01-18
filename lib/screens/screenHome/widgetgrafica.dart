import 'package:desing_wallet/Services/sharedpreferences.dart';
import 'package:desing_wallet/screens/screenPrincipal/types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_chart_flutter/circular_chart_flutter.dart';

// ignore: must_be_immutable
class PieChartWidget extends StatelessWidget {
  const PieChartWidget({Key? key}) : super(key: key);
  //late NumberFormat real;
  //late ContaRepository conta;
  final size = const Size(300.0, 300.0);
  @override
  Widget build(BuildContext context) {
    Size sizep = MediaQuery.of(context).size;
    return Stack(children: [
      Column(
        children: [
          AnimatedCircularChart(
              duration: const Duration(seconds: 2),
              holeRadius: 70,
              percentageValues: true,
              size: size,
              initialChartData: _datosGrafica(50.0, "Percent")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                infoPieGrafirca("100% contraprestación", sizep,
                    sld(UserPreferences.sueldo), Colors.teal, context),
                infoPieGrafirca("70% libre de facturación", sizep,
                    libre(UserPreferences.sueldo), Colors.green, context),
                infoPieGrafirca("30% cantidad a facturar", sizep,
                    cantidad(UserPreferences.sueldo), Colors.red, context),
              ],
            ),
          ),
        ],
      ),
    ]);
  }

  GestureDetector infoPieGrafirca(String content, Size sizep, String descrip,
      Color color, BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCupertinoDialog(
            context: context,
            barrierDismissible: true,
            builder: (BuildContext context) {
              return Theme(
                data: ThemeData.dark(),
                child: CupertinoAlertDialog(
                  title: Text("\$$descrip"),
                  insetAnimationCurve: Curves.bounceInOut,
                  insetAnimationDuration:const  Duration(seconds: 1),
                  content: Text(content),
                ),
              );
            });
      },
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            width: sizep.height * 0.02,
            height: sizep.height * 0.02,
          ),
          Text(
            " \$$descrip",
            style: ETypes().styleEstado,
          ),
        ],
      ),
    );
  }

  // ignore: unused_element
  List<CircularStackEntry> _datosGrafica(double value, String rank) {
    List<CircularStackEntry> _datos = <CircularStackEntry>[
      CircularStackEntry(<CircularSegmentEntry>[
        const CircularSegmentEntry(30, Colors.red, rankKey: "Factura")
      ], rankKey: rank)
    ];
    _datos.add(CircularStackEntry(<CircularSegmentEntry>[
      const CircularSegmentEntry(70, Colors.green, rankKey: "Libre")
    ], rankKey: rank));
    _datos.add(CircularStackEntry(<CircularSegmentEntry>[
      const CircularSegmentEntry(100, Colors.teal, rankKey: "Total")
    ], rankKey: rank));
    return _datos;
  }

  String cantidad(String s) {
    int sl = int.parse(s);
    var fac = sl * 0.30;
    return fac.toString() + "0";
  }

  String libre(String s) {
    double porc = double.parse(cantidad(s));
    double sueldo = double.parse(s);
    double libre = sueldo - porc;
    return libre.toString() + "0";
  }

  String sld(String s) {
    return s + ".00";
  }
}
