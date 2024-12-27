import 'package:flutter/material.dart';
import 'package:jaspr/helper/global_constants.dart';
import 'package:jaspr/pallete.dart';
import 'package:jaspr/screens/home_page.dart';
import 'package:jaspr/screens/onboarding_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Card(
              elevation: 0,
              color: Pallete.whiteColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: EdgeInsets.all(mq.width * .05),
                child: Image.asset('assets/images/logo.png',
                    width: mq.width * .35),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Jaspr',
              style: TextStyle(fontSize: 16),
            ),
            Lottie.network(
                'https://lottie.host/f9889007-d634-4032-aa77-d5bbf060ebe8/CyR8mpDwgG.json',
                width: 200),
            Spacer()
          ],
        ),
      ),
    );
  }
}