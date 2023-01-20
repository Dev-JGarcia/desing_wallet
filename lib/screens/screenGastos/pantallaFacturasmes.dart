// ignore_for_file: file_names

import 'package:desing_wallet/Services/model.dart';
import 'package:desing_wallet/providers/provider.dart';
import 'package:desing_wallet/screens/screenGastos/widgets/CustomAppBar.dart';
import 'package:desing_wallet/screens/screenGastos/widgets/cuerpoList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../Services/sharedpreferences.dart';
import '../screenPrincipal/types.dart';

class HomeScreen extends StatefulWidget {
  final bool mesActivo;
  final String mes;
  const HomeScreen(
      {Key? key, required this.mesActivo, required this.mes})
      : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textFecha = TextEditingController();
  TextEditingController controlador = TextEditingController();
  TextEditingController controladorC = TextEditingController();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xff141414),
      appBar: CustomAppBar(height: size.height, mes: widget.mes),
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
                  containerAdd(size, context),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

// ! contenedor elevatedboton agregar
  Container containerAdd(Size size, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: size.height * 0.02, bottom: size.height * 0.01),
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
                  onPressed: !widget.mesActivo
                      ? null
                      : () {
                          debugPrint("Activo");
                          _showDialog(context);
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

  _selectFecha(BuildContext context) async {
    String dayAux;
    String monthAux;
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );

    if (selected != null && selected != selectedDate)
      // ignore: curly_braces_in_flow_control_structures
      setState(() {
        selectedDate = selected;
      });
    if (selectedDate.day < 10) {
      // valigación si día es menor a 10 agregar 0
      dayAux = "0${selectedDate.day}";
    } else {
      dayAux = "${selectedDate.day}";
    }
    // valigación si mes es menor a 10 agregar 0
    if (selectedDate.month < 10) {
      monthAux = "0${selectedDate.month}";
    } else {
      monthAux = "${selectedDate.month}";
    }

    setState(() {
      textFecha.text = '${selectedDate.year}/$monthAux/$dayAux';
    });
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

  _showDialog(BuildContext context) {
    final db = Provider.of<ProviderApp>(context,listen: false);
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Theme(
              data: ThemeData.dark(),
              child: CupertinoAlertDialog(
                title: Column(
                  children: const [
                    Text("Detalles de nueva factura"),
                    Icon(
                      Icons.format_list_numbered_rounded,
                      color: Colors.white,
                    ),
                  ],
                ),
                content: Card(
                  child: Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: const Color(0xff141414)
                                  .withOpacity(0.5)),
                          onPressed: () {
                            _selectFecha(context);
                          },
                          child: const Text("Seleccionar Fecha")),
                      TextField(
                        controller: textFecha,
                        textAlign: TextAlign.center,
                        enabled: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text("Descripcion:"),
                      SizedBox(
                        height: 33,
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter
                                .singleLineFormatter
                          ],
                          controller: controlador,
                          decoration: decorationInput(
                              "", const Icon(Icons.description)),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text("Cantidad facturada"),
                      SizedBox(
                        height: 33,
                        width: 120,
                        child: TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.phone,
                          controller: controladorC,
                          decoration: decorationInput("",
                              const Icon(Icons.attach_money_rounded)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text("Cancelar"),
                    onPressed: () {
                      textFecha.text = "";
                      controlador.text = "";
                      controladorC.text = "";
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoDialogAction(
                    child: const Text("Guardar"),
                    onPressed: () async {
                      if (controlador.text.isEmpty ||
                          controladorC.text.isEmpty ||
                          textFecha.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg:
                                "Información incompleta - Llene la informacion requerida");
                      } else {
                        var fec = textFecha.text.split('/');
                        Factura fac = Factura(
                          id: null,
                            date: textFecha.text,
                            month: fec[1],
                            year: fec[0],
                            descrip: controlador.text,
                            monto: controladorC.text,
                            sueldoActual: "20000");
                        var i = await db.insertarFactura(fac);
                        if (i == 1) {
                          debugPrint(
                              "${controlador.text} - ${controladorC.text}");
                          Navigator.of(context).pop();
                        } else {
                          debugPrint("no se inserto");
                        }
                      }
                    },
                  ),
                ],
              ));
        });
  }

  InputDecoration decorationInput(String hintText, Icon icon) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: icon,
      contentPadding: const EdgeInsets.all(5),
      hintStyle: ETypes().styleEstado,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(
          color: Colors
              .white, //El color que debe de tomar (si existe error(rojo) o no(verde))
        ),
      ),
    );
  }
}
