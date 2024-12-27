import 'package:flutter/material.dart';
import 'package:jaspr/helper/global_constants.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.network(
            'https://lottie.host/e23938ee-049b-4ced-a831-d97dcbacf46d/v6aDbl0pMN.json',
          ),
          Text(
            'Ask Me Anything',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: .5),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: mq.width * .7,
            child: Text(
              'We can have casual conversations. Perhaps an idea on your mind or a subject of your interests. Ask me a question and I\'ll be glad to answer that!',
              style: TextStyle(fontSize: 14, letterSpacing: .5),
            ),
          )
        ],
      ),
    );
  }
}
