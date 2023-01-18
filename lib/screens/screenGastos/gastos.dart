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
    return Stack(
      children: [
        GridView2(),
        Container(
          margin: EdgeInsets.only(
              top: size.height * 0.02, bottom: size.height * 0.02),
          height: size.height * 0.07,
          width:double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Text(
                  "Facturas del año",
                  style: ETypes().styleChangeName,
                ),
              ),
              Text(
                "Total facturado hasta hoy: \$1500",
                style: ETypes().styleChangeName,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
