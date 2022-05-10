import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather/screens/homePage.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: "Weather App",
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 4), () {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => HomePage()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Lottie.asset(
        "assets/ind.json",
        repeat: true,
        onLoaded: (a) async {
          await Future.delayed(Duration(seconds: 4));
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage()));
        },
      )),
    );
  }
}
