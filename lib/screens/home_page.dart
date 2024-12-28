import 'package:flutter/material.dart';
import 'package:jaspr/helper/global_constants.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Jaspr'),
        centerTitle: true,
        leading: Icon(Icons.menu),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              height: 150,
              width: 150,
              margin: EdgeInsets.only(top: 4),
              child: Lottie.asset('assets/lottie/jaspr.json'),
            ),
          ),
        ],
      ),
    );
  }
}
