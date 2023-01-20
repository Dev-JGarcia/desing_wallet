import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class BaseDeDatos {
  BaseDeDatos._() {
    initDB();
  }

  static final BaseDeDatos db = BaseDeDatos._();
  static late Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await initDB();
      return _database;
    }
  }

  initDB() async {
    Directory documentesDirectory =
        await getApplicationDocumentsDirectory();
    final path = join(documentesDirectory.path, 'facturacion.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Facturas ('
          'CvFactura INTEGER PRIMARY KEY, '
          'fecha TEXT, '
          'mes TEXT, '
          'ano TEXT, '
          'descripcion TEXT, '
          'monto TEXT, '
          'sueldoActual TEXT'
          ')');
    });
  }
}
