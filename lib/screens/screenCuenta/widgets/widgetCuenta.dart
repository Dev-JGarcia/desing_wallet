// ignore_for_file: file_names
import 'package:desing_wallet/Services/sharedpreferences.dart';
import 'package:desing_wallet/screens/screenInfo/pageinfo.dart';
import 'package:desing_wallet/screens/screenPrincipal/types.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class WidgetBodyCuenta extends StatefulWidget {
  const WidgetBodyCuenta({
    Key? key,
  }) : super(key: key);

  @override
  State<WidgetBodyCuenta> createState() => _WidgetBodyCuentaState();
}

class _WidgetBodyCuentaState extends State<WidgetBodyCuenta> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: size.height * 0.02, bottom: size.height * 0.02),
          //height: 100,
          width: size.width - 30,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    mesActual(),
                    style: ETypes().stylesaux,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              LinearPercentIndicator(
                width: size.width - 50,
                animation: true,
                animationDuration: 1500,
                lineHeight: 10.0,
                percent: 1.0,
                backgroundColor: Colors.grey,
                progressColor: Colors.teal,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "  Ingresos \$${sld(UserPreferences.sueldo)}",
                    style: ETypes().stylesaux,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),

              //!Gastos

              LinearPercentIndicator(
                width: size.width - 50,
                animation: true,
                animationDuration: 1500,
                lineHeight: 10.0,
                percent: 0.3,
                backgroundColor: Colors.grey,
                progressColor: Colors.red,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "  Gastos: sumaSql de \$${cantidad(UserPreferences.sueldo)}",
                    style: ETypes().stylesaux,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),

              //!Libre
              LinearPercentIndicator(
                width: size.width - 50,
                animation: true,
                animationDuration: 1500,
                lineHeight: 10.0,
                percent: 0.7,
                backgroundColor: Colors.grey,
                progressColor: Colors.green,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "  Libre Sld-Sumasql \$${UserPreferences.sueldo}",
                    style: ETypes().stylesaux,
                  ),
                ],
              )
            ],
          ),
        ),

        //!Infoogen
        Container(
          margin: EdgeInsets.only(
              top: size.height * 0.02, bottom: size.height * 0.02),
          //height: 100,
          width: size.width - 30,
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
              Text(
                "Tu balance",
                style: ETypes().stylesaux,
              ),
              const Divider(
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "\$${UserPreferences.sueldo}\nTotal cuenta",
                    style: ETypes().stylesaux,
                  ),
                  Text(
                    "\$${UserPreferences.sueldo}\nTotal facturado",
                    style: ETypes().stylesaux,
                  ),
                ],
              )
            ],
          ),
        ),

        //! datos
        Container(
          margin: EdgeInsets.only(
              top: size.height * 0.02, bottom: size.height * 0.02),
          //height: 100,
          width: size.width - 30,
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            color: Color(0xff17191F),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Datos actuales",
                      style: ETypes().stylesaux,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Card(
                        color: Colors.white38,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.02,
                              vertical: size.height * 0.025),
                          child: Text(
                            " Ingresos:\n\$${sld(UserPreferences.sueldo)}",
                            style: ETypes().styleName,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: size.width - 100,
                          child: Text(
                            "Nombre: \n${UserPreferences.nombreSaved}",
                            style: ETypes().stylesaux,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xff141414)),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MyCustomUI()));
                                },
                                child: Text(
                                  "Editar",
                                  style: ETypes().styleSueldo,
                                )),
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
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

  String mesActual() {
    DateTime fchActual = DateTime.now();
    int fecha = fchActual.month;
    String? fechareturn;
    switch (fecha) {
      case 1:
        fechareturn = "Enero";
        break;
      case 2:
        fechareturn = "Febrero";
        break;
      case 3:
        fechareturn = "Marzo";
        break;
      case 4:
        fechareturn = "Abril";
        break;
      case 5:
        fechareturn = "Mayo";
        break;
      case 6:
        fechareturn = "Junio";
        break;
      case 7:
        fechareturn = "Julio";
        break;
      case 8:
        fechareturn = "Agosto";
        break;
      case 9:
        fechareturn = "Septiembre";
        break;
      case 10:
        fechareturn = "Octubre";
        break;
      case 11:
        fechareturn = "Noviembre";
        break;
      case 12:
        fechareturn = "Diciembre";
        break;
      default:
    }
    return fechareturn!;
  }
}
