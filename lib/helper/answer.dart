import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:jaspr/pallete.dart';
import 'package:jaspr/services/chat_service.dart';

class Answer extends StatefulWidget {
  const Answer({super.key});

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  String fullResponse = '';

  @override
  void initState() {
    super.initState();
    ChatService().contentStream.listen((data) {
      setState(() {
        fullResponse += data["data"];
      });
    });
  }

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
                fontSize: 20,
              ),
            ),
          ],
        ),
        Markdown(
          data: fullResponse,
          shrinkWrap: true,
          styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
              codeblockDecoration: BoxDecoration(
                color: Pallete.firstSuggestionBoxColor,
                borderRadius: BorderRadius.circular(10),
              ),
              code: const TextStyle(fontSize: 16)),
        )
      ],
    );
  }
}
