import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:jaspr/pallete.dart';
import 'package:jaspr/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jaspr',
      theme: ThemeData.light(useMaterial3: true).copyWith(
          textTheme: TextTheme(
              titleMedium: TextStyle(
            fontFamily: 'Cera-Pro',
            fontSize: 20,
          )),
          scaffoldBackgroundColor: Pallete.whiteColor,
          appBarTheme: AppBarTheme(backgroundColor: Pallete.whiteColor)),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
