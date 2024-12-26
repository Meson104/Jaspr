import 'package:flutter/material.dart';
import 'package:jaspr/home_page.dart';
import 'package:jaspr/pallete.dart';

void main() {
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
          scaffoldBackgroundColor: Pallete.whiteColor,
          appBarTheme: AppBarTheme(backgroundColor: Pallete.whiteColor)),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
