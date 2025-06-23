import 'package:flutter/material.dart';
import 'package:frontend/helper/answer.dart';
import 'package:frontend/helper/sources.dart';
import 'package:frontend/pallete.dart';

class ChatScreen extends StatelessWidget {
  final String question;
  const ChatScreen({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  question,
                  style: TextStyle(
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    color: Pallete.boldcolor,
                  ),
                ),
              ),
              Sources(),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Answer(),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
