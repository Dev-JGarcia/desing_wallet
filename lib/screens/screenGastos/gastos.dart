import 'package:desing_wallet/screens/screenCuenta/widgets/bodyList.dart';
import 'package:desing_wallet/screens/screenPrincipal/types.dart';
import 'package:flutter/material.dart';

class WidgetBodyGastos extends StatefulWidget {
  const WidgetBodyGastos({
    Key? key,
  }) : super(key: key);

  @override
  State<WidgetBodyGastos> createState() => _WidgetBodyGastosState();
}

class _WidgetBodyGastosState extends State<WidgetBodyGastos> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin:
          EdgeInsets.only(top: size.height * 0.02, bottom: size.height * 0.02),
      height: size.height * 0.55,
      decoration: const BoxDecoration(
        color: Color(0xff17191F),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Facturas del año",
                  style: ETypes().styleSueldo,
                ),
                Text(
                  "Total facturado hasta hoy: \$1500",
                  style: ETypes().styleSueldo,
                ),
              ],
            ),
          ),
          GridView2(),
        ],
      ),
    );
  }
}
