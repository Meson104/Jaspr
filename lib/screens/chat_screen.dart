import 'package:flutter/material.dart';
import 'package:jaspr/helper/answer.dart';
import 'package:jaspr/helper/sources.dart';
import 'package:jaspr/pallete.dart';

class ChatScreen extends StatelessWidget {
  final String question;
  const ChatScreen({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              question,
              style: TextStyle(
                  fontFamily: 'Exo2',
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Pallete.boldcolor),
            ),
          ),
          Sources(),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Answer(),
          )
        ],
      ),
    );
  }
}
