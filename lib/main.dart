import 'package:flutter/material.dart';
import 'package:jaspr/pallete.dart';
import 'package:jaspr/screens/splash_screen.dart';

void main() async {
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
            textTheme: ThemeData.light().textTheme.copyWith(
                bodyMedium: const TextStyle(
                    fontSize: 14, color: Color.fromARGB(204, 13, 13, 13))),
            scaffoldBackgroundColor: Pallete.whiteColor,
            appBarTheme: AppBarTheme(
              backgroundColor: Pallete.whiteColor,
            )),
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
