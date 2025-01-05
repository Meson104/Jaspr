import 'package:flutter/material.dart';
import 'package:jaspr/pallete.dart';

class Answer extends StatefulWidget {
  const Answer({super.key});

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.bubble_chart_rounded,
              color: Pallete.boldcolor,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'Here\'s what I found',
              style: TextStyle(
                fontFamily: 'Exo2',
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
            ),
          ],
        )
      ],
    );
  }
}
