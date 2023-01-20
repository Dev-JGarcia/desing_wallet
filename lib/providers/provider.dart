import 'package:desing_wallet/Services/db_local.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import 'package:desing_wallet/Services/model.dart';
import 'package:path/path.dart';

class ProviderApp with ChangeNotifier {
  String _cuerpoPantalla = "Home";

  String get cuerpoPantalla => _cuerpoPantalla;
  set cuerpoPantalla(String value) {
    _cuerpoPantalla = value;
    notifyListeners();
  }

  bool loadingDB = false;

  static Future<Database> _abrirBD() async {
    BaseDeDatos.db.database;
    return openDatabase(
      join(await getDatabasesPath(), 'facturacion.db'),
      version: 1,
    );
  }

  Future<int> insertarFactura(Factura f) async {
    loadingDB = true;
    notifyListeners();
    Database db = await _abrirBD();
    db.execute(
        "INSERT INTO Facturas (CvFactura, fecha, mes, ano, descripcion, monto, sueldoActual) VALUES (1,'2023/01/20', '01', '2023', 'xxx', '5555', '0.0')");
    loadingDB = false;
    notifyListeners();
    return 1;
  }

  Future<List<Factura>> facturasMesDe(String mes, String ano) async {
    loadingDB = true;
    notifyListeners();
    final db = await _abrirBD();
    final res = await db.rawQuery(
        "SELECT * FROM Facturas WHERE mes='$mes' AND ano='$ano'");
    List<Factura> list = res.isNotEmpty
        ? res.map((c) => Factura.fromJson(c)).toList()
        : [];
    loadingDB = false;
    notifyListeners();
    return list;
  }
}
