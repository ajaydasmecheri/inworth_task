// ignore_for_file: depend_on_referenced_packages

import 'package:inworth_task/screens/homepage.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: double.infinity,
      duration: 5000,
      splash: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child:LottieBuilder.asset(
                'assets/image/splashlogo.json',
                fit: BoxFit.fill,
              ),
            ),
            RichText(
              text: const TextSpan(
              children: [
                TextSpan(
                  text: 'Call super heroes ',
                  style: TextStyle( fontFamily:"caveat"  , color: Colors.black, fontSize: 30),
                ),
                TextSpan(
                  text: '" do nothing "',
                  style: TextStyle(fontFamily: "caveat" , color: Colors.red, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),),

            
          ],
        ),
      ),
      pageTransitionType: PageTransitionType.fade,
      nextScreen: const Homepage(),
    );
  }
}
