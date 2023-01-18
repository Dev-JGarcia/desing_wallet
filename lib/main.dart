import 'package:desing_wallet/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Services/sharedpreferences.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  debugPrint("Image ${UserPreferences.pathImag}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: ((context) => ProviderApp()))],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: rutasPaginas(),
        initialRoute: 'splash',
      ),
    );
  }
}
