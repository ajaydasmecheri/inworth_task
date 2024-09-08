import 'package:flutter/material.dart';
import 'package:inworth_task/routers.dart';
import 'package:inworth_task/screens/fulldetails.dart';
import 'package:inworth_task/screens/homepage.dart';
import 'package:inworth_task/screens/splashpage.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routers.splashpage,
      routes: {
        Routers.homepage:(context)=> const Homepage(),
        Routers.splashpage:(context)=> const SplashScreen(),
        Routers.fulldetails:(context)=> const Fulldetails()
      },
    );
  }
}