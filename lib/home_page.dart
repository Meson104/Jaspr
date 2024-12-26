import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
              child: Lottie.network(
                  'https://lottie.host/20dc4179-6b64-4c8b-bb5c-3d5e0b073756/Nc9reIJhUu.json'),
            ),
          ),
        ],
      ),
    );
  }
}
