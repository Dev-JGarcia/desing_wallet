import 'package:flutter/material.dart';

class ProviderApp with ChangeNotifier {
  String _cuerpoPantalla = "Home";

  String get cuerpoPantalla => _cuerpoPantalla;
  set cuerpoPantalla(String value) {
    _cuerpoPantalla = value;
    notifyListeners();
  }
}
