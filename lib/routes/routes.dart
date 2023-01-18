import 'package:desing_wallet/screens/screenInfo/pageinfo.dart';
import 'package:desing_wallet/screens/screenPrincipal/home.dart';
import 'package:desing_wallet/widgets/splashscreen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> rutasPaginas() {
  return <String, WidgetBuilder>{
    'home': ((context) => const HomeScreen()),
    'principal': (context) => const MyCustomUI(),
    'splash':(context) => const MyCustomSplashScreen()
  };
}
