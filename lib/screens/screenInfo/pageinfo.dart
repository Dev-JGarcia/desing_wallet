import 'dart:io';
import 'dart:ui';
import 'package:desing_wallet/Services/sharedpreferences.dart';
import 'package:desing_wallet/screens/screenPrincipal/home.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

import '../screenPrincipal/types.dart';

class MyCustomUI extends StatefulWidget {
  const MyCustomUI({Key? key}) : super(key: key);

  @override
  _MyCustomUIState createState() => _MyCustomUIState();
}

class _MyCustomUIState extends State<MyCustomUI> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;
  TextEditingController textCampo1 = TextEditingController();
  late TextEditingController textCampo2 = TextEditingController();

  bool _bool = true;
  late String imgPath = "";
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _animation1 = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _bool = true;
        }
      });
    _animation2 = Tween<double>(begin: 0, end: .3).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animation3 = Tween<double>(begin: .9, end: 1).animate(CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    _animationController.forward();
    _bool = false;
    return Scaffold(
      body: Stack(
        children: [
          // ALWAYS PLACE IT ON THE TOP OF EVERY WIDGET...
          backgroundImage(),

          // EVERYTHING SHOULD BE HERE...
          SizedBox(
            height: _height,
            width: _width,
            child: null,
          ),

          // ALWAYS PLACE IT ON THE BOTTOM OF EVERY WIDGET...
          customNavigationDrawer(),
        ],
      ),
    );
  }

  Directory? rootPath;
  Widget customNavigationDrawer() {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaY: _animation1.value, sigmaX: _animation1.value),
      child: Container(
        height: _bool ? 0 : _height,
        width: _bool ? 0 : _width,
        color: Colors.transparent,
        child: Center(
          child: Transform.scale(
            scale: _animation3.value,
            child: Container(
              width: _width * .9,
              height: _width * 1.3,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(_animation2.value),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 45,
                      backgroundImage:
                          (imgPath.isEmpty) ? null : FileImage(File(imgPath)),
                      child: (imgPath.isEmpty)
                          ? const Icon(
                              Icons.person_outline_rounded,
                              size: 30,
                              color: Colors.white,
                            )
                          : null),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: const Color(0xff141414)),
                      onPressed: () async {
                        final result = await FilePicker.platform
                            .pickFiles(allowMultiple: false);

                        if (Platform.isAndroid) {
                          final rtPath = await getExternalStorageDirectories(
                              type: StorageDirectory.downloads);

                          rootPath = Directory(rtPath![0].path);
                          debugPrint(rootPath.toString());
                        } else {
                          final pathDocs = await getDownloadsDirectory();
                          rootPath = Directory(pathDocs!.path);
                        }

                        final file = result!.files.first;
                        debugPrint(file.name);
                        Directory dir = Directory(rootPath!.path.toString());
                        var savePath = dir.path;
                        final newPathStorage = File('$savePath/${file.name}');
                        File(file.path!).copy(newPathStorage.path);

                        setState(() {
                          imgPath = newPathStorage.path.toString();
                          UserPreferences.pathImag = imgPath;
                        });
                        debugPrint(UserPreferences.pathImag);
                      },
                      child: const Text("Seleccionar Foto")),
                  Column(
                    children: [
                      infoWid("Nombre/Usuario/Correo:"),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: customDecoration(),
                            controller: textCampo1,
                            cursorColor: const Color(0xff141414),
                            style: ETypes().styleChangeName,
                            maxLength: 35,
                          ),
                        ),
                      ),
                      infoWid("Sueldo"),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SizedBox(
                          height: 50,
                          child: TextField(
                            decoration: customDecoration(),
                            keyboardType: TextInputType.phone,
                            controller: textCampo2,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            cursorColor: const Color(0xff141414),
                            style: ETypes().styleChangeName,
                            maxLength: 5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: _height * 0.02,
                            horizontal: _width * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xff141414)),
                                onPressed: () {
                                  if (textCampo1.text.isEmpty ||
                                      textCampo2.text.isEmpty) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "Llena Todos los campos / Selecciona una Foto");
                                  } else {
                                    UserPreferences.isInfoPass = true;
                                    UserPreferences.pathImag = imgPath;
                                    UserPreferences.nombreSaved =
                                        textCampo1.text;
                                    UserPreferences.sueldo = textCampo2.text;

                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()));
                                  }
                                },
                                child: const Text("Guardar Información")),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding infoWid(String descripcion) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: Row(
        children: [
          Text(
            descripcion,
            style: ETypes().styleChangeName,
          ),
        ],
      ),
    );
  }

  Widget backgroundImage() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        'assets/bacground.jpg',
        fit: BoxFit.fitHeight,
      ),
    );
  }

  Widget myTile(
    IconData icon,
    String title,
    VoidCallback voidCallback,
  ) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.black.withOpacity(.08),
          leading: CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          onTap: voidCallback,
          title: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          trailing: const Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
        ),
        divider()
      ],
    );
  }

  Widget divider() {
    return SizedBox(
      height: 5,
      width: MediaQuery.of(context).size.width,
    );
  }
}

InputDecoration customDecoration() => InputDecoration(
      enabledBorder: customBorder(),
      border: customBorder(),
      focusedBorder: customBorder(),
      focusColor: const Color(0xff141414),
      hoverColor: const Color(0xff141414),
    );

OutlineInputBorder customBorder() {
  return OutlineInputBorder(
    borderSide: const BorderSide(
      width: 2,
      color: Color(0xff141414),
    ),
    borderRadius: BorderRadius.circular(10.0),
  );
}
