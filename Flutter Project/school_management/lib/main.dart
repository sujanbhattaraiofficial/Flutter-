import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:school_management/Services/navigationServices.dart';
import 'splashScreen.dart';
import 'locator.dart';
import 'router.dart' as router;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      onGenerateRoute: router.generateRoute,
      navigatorKey: sl<NavigationServices>().navigatorKey,
      theme: ThemeData(primarySwatch: Colors.blue),
      title: "e-School",
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
