// ignore_for_file: file_names

import 'package:desing_wallet/Services/sharedpreferences.dart';
import 'package:desing_wallet/screens/screenHome/widgetgrafica.dart';
import 'package:desing_wallet/screens/screenPrincipal/types.dart';
import 'package:flutter/material.dart';

class WidgetBodyHomePrincipal extends StatefulWidget {
  const WidgetBodyHomePrincipal({
    Key? key,
  }) : super(key: key);

  @override
  State<WidgetBodyHomePrincipal> createState() =>
      _WidgetBodyHomePrincipalState();
}

class _WidgetBodyHomePrincipalState extends State<WidgetBodyHomePrincipal> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top: size.height * 0.02,
          ),
          height: size.height * 0.14,
          width: size.width - 30,
          decoration: const BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 8),
                child: Text(
                  "Contraprestación: \$${UserPreferences.sueldo}",
                  style: ETypes().styleSueldo,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 8, right: 5),
                    child: Text(
                      "Cantidad a facturar: \$${cantidad(UserPreferences.sueldo)}",
                      style: ETypes().stylesaux,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 8, right: 5),
                    child: Text(
                      "Cantidad Libre de facturas: \$${libre(UserPreferences.sueldo)}",
                      style: ETypes().stylesaux,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        PieChartWidget()
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
    return libre.toString();
  }
}
