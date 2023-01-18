// ignore_for_file: file_names, must_be_immutable

import 'package:desing_wallet/screens/screenGastos/pantallaFacturasmes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridView2 extends StatelessWidget {
  GridView2({Key? key}) : super(key: key);
  DateTime fchActual = DateTime.now();
  int? fecha;
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;

    fecha = fchActual.month;
    int columnCount = 3;

    return AnimationLimiter(
      child: GridView.count(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.only(left: _w / 60, right: _w / 60, top: _h * 0.12),
        crossAxisCount: columnCount,
        children: List.generate(
          12,
          (int index) {
            debugPrint("$index && $fecha");
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 500),
              columnCount: columnCount,
              child: ScaleAnimation(
                duration: const Duration(milliseconds: 900),
                curve: Curves.fastLinearToSlowEaseIn,
                scale: 1.5,
                child: FadeInAnimation(
                  child: GestureDetector(
                    onTap: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                    mesActivo:
                                        fecha == index + 1 ? true : false,
                                    mes: listOfMonth[index],
                                  )));
                    }),
                    child: Container(
                      margin: EdgeInsets.only(
                          bottom: _w / 10, left: _w / 60, right: _w / 60),
                      decoration: BoxDecoration(
                        color: fecha == index + 1
                            ? Colors.white
                            : Colors.white.withOpacity(0.3),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 10,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(listOfMonth[index]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<String> listOfMonth = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre',
  ];
}
