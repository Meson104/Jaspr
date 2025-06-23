import 'package:flutter/material.dart';
import 'package:frontend/pallete.dart';
import 'package:frontend/services/chat_service.dart';

class Sources extends StatefulWidget {
  const Sources({super.key});

  @override
  State<Sources> createState() => _SourcesState();
}

class _SourcesState extends State<Sources> {
  List searchResults = [];
  @override
  void initState() {
    super.initState();
    ChatService().searchResultStream.listen((data) {
      setState(() {
        searchResults = (data["data"]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            children: [
              Icon(Icons.source_rounded, color: Pallete.boldcolor),
              SizedBox(width: 8),
              Text(
                'Sources',
                style: TextStyle(
                  fontFamily: 'Exo2',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          runAlignment: WrapAlignment.start,
          children: searchResults.map((res) {
            return Container(
              padding: EdgeInsets.all(16),
              width: 140,
              decoration: BoxDecoration(
                color: Pallete.borderColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    res['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Exo2',
                      fontSize: 14,
                      color: const Color.fromARGB(255, 35, 34, 34),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    res['url'],
                    style: TextStyle(
                      fontFamily: 'Exo2',
                      fontSize: 12,
                      color: const Color.fromARGB(242, 0, 0, 0),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
