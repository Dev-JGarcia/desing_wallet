import 'dart:io';

import 'package:desing_wallet/Services/sharedpreferences.dart';
import 'package:desing_wallet/providers/provider.dart';
import 'package:desing_wallet/screens/screenGastos/gastos.dart';
import 'package:desing_wallet/screens/screenHome/vistaPrincipal.dart';
import 'package:desing_wallet/widgets/widgetTabBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/widgetname.dart';
import '../screenCuenta/widgets/widgetCuenta.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final provider = Provider.of<ProviderApp>(context);
    Provider.of<ProviderApp>(context);
    debugPrint(UserPreferences.pathImag);
    return Scaffold(
      backgroundColor: const Color(0xff141414),
      bottomNavigationBar: const WidgetBodyTadBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: size.height * 0.03),
                child: CircleAvatar(
                  radius: size.width * 0.2,
                  backgroundImage: FileImage(File(UserPreferences.pathImag)),
                ),
              ),
            ),
            WidgetName(size: size),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: size.height * 0.02),
                width: size.width - 20,
                decoration: const BoxDecoration(
                  color: Color(0xff0E1013),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(provider.cuerpoPantalla,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        )),
                    provider.cuerpoPantalla == "Facturas"
                        ? const SingleChildScrollView(child: WidgetBodyGastos())
                        : provider.cuerpoPantalla == "Home"
                            ? const SingleChildScrollView(
                                child: WidgetBodyHomePrincipal())
                            : const SingleChildScrollView(
                                child: WidgetBodyCuenta())
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
