import 'package:flutter/material.dart';
import 'package:jaspr/helper/global_constants.dart';
import 'package:jaspr/helper/onboard.dart';
import 'package:jaspr/pallete.dart';
import 'package:jaspr/screens/home_page.dart';
import 'package:lottie/lottie.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      Onboard(
          title: 'Greetings, I am Jaspr',
          subtitle:
              'J.A.S.P.R. Just Another System for Pretrained Responses. As of today I\'m capable of serving you with textual and pictoral responses. Would be at your service!',
          lottie: 'assets/lottie/jaspr.json'),
      Onboard(
          title: 'Ask Me Anything',
          subtitle:
              'We can have casual conversations. Perhaps an idea on your mind or a subject of your interests. Ask me a question and I\'ll be glad to answer that!',
          lottie: 'assets/lottie/ai_talk.json'),
      Onboard(
          title: 'I\'m literally all ears!',
          subtitle:
              'Send queries using your voice. Tap the voice button and I\'ll be listening as you speak',
          lottie: 'assets/lottie/voice.json'),
    ];
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: PageView.builder(
          controller: c,
          itemCount: list.length,
          itemBuilder: (context, index) {
            final isLast = index == list.length - 1;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(
                  flex: 2,
                ),
                Lottie.asset(list[index].lottie, width: mq.width * .6),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  list[index].title,
                  style: TextStyle(
                      fontFamily: 'Cera-Pro',
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      letterSpacing: .5),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: mq.width * .7,
                  child: Text(
                    list[index].subtitle,
                    style: TextStyle(
                        fontFamily: 'Cera-Pro',
                        fontSize: 12,
                        letterSpacing: .5),
                  ),
                ),
                Spacer(),
                Wrap(
                  spacing: 10,
                  children: List.generate(
                      list.length,
                      (i) => Container(
                            height: i == index ? 10 : 8,
                            width: i == index ? 10 : 8,
                            decoration: BoxDecoration(
                              color: i == index
                                  ? Pallete.button
                                  : Pallete.onboardDots,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                          )),
                ),
                Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: StadiumBorder(),
                    minimumSize: Size(mq.width * .3, 45),
                    backgroundColor: Pallete.button,
                  ),
                  onPressed: () {
                    if (isLast) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => HomePage()));
                    } else {
                      c.nextPage(
                          duration: Duration(milliseconds: 600),
                          curve: Curves.ease);
                    }
                  },
                  child: Text(
                    isLast ? 'Finish' : 'Next',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Pallete.whiteColor),
                  ),
                ),
                Spacer(
                  flex: 2,
                )
              ],
            );
          }),
    );
  }
}
