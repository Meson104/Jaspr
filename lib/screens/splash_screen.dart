import 'package:flutter/material.dart';
import 'package:jaspr/helper/global_constants.dart';
import 'package:jaspr/pallete.dart';
import 'package:jaspr/screens/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
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
              height: 20,
            ),
            Text(
              'Jaspr',
              style: TextStyle(fontFamily: 'Exo2', fontSize: 16),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
