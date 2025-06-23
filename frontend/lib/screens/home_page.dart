import 'package:flutter/material.dart';
import 'package:frontend/helper/gloabl_constants.dart';
import 'package:frontend/pallete.dart';
import 'package:frontend/screens/chat_screen.dart';
import 'package:frontend/services/chat_service.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String fullResponse = "";
  final queryController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    queryController.dispose();
  }

  @override
  void initState() {
    super.initState();
    ChatService().connect();
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(leading: Icon(Icons.menu)),
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
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.symmetric(horizontal: 40).copyWith(top: 30),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Hi, How can I help?',
                style: TextStyle(
                  fontFamily: 'Exo2',
                  letterSpacing: 0.6,
                  fontSize: mq.width * .05,
                  color: Pallete.onboardDots,
                  height: 2,
                ),
              ),
            ),
          ),
          const Spacer(),
          // StreamBuilder(
          //     stream: ChatService().contentStream,
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       }

          //     }),
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: queryController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'Search anything...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Pallete.inputHintColor,
                              ),
                            ),
                            style: TextStyle(
                              color: const Color.fromARGB(211, 0, 0, 0),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ChatService().chat(queryController.text.trim());
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                  question: queryController.text.trim(),
                                ),
                              ),
                            );
                          },
                          child: Icon(
                            Icons.arrow_forward,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // Voice Command Button
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Pallete.inputBgColor,
                  child: IconButton(
                    icon: Icon(Icons.mic, color: Pallete.inputIconColor),
                    onPressed: () {
                      // Voice command action
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
