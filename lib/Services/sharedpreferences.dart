import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static late SharedPreferences _prefs;

  static bool _isInfoPass = false;
  static String _pathImg = "";
  static String _nombre = "";
  static String _sueldo = "";

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

//! Guardar informacion
  static bool get isInfoPass {
    return _prefs.getBool('isInfoPass') ?? _isInfoPass;
  }

  static set isInfoPass(bool value) {
    _isInfoPass = value;
    _prefs.setBool('isInfoPass', value);
  }

//! Guardar Path de imagen
  static String get pathImag {
    return _prefs.getString('pathIma') ?? _pathImg;
  }

  static set pathImag(String value) {
    _pathImg = value;
    _prefs.setString('pathIma', value);
  }

//! Guardar Nombre
  static String get nombreSaved {
    return _prefs.getString('nombre') ?? _nombre;
  }

  static set nombreSaved(String value) {
    _nombre = value;
    _prefs.setString('nombre', value);
  }

  //! Guardar sueldo
  static String get sueldo {
    return _prefs.getString('sueldo') ?? _sueldo;
  }

  static set sueldo(String value) {
    _sueldo = value;
    _prefs.setString('sueldo', value);
  }
}
