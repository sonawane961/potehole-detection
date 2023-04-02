import 'dart:async';

import 'package:flutter/material.dart';
import 'package:spothole/screens/homeScreen.dart';

import 'infoScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  static const routeName = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(
      const Duration(seconds: 3), 
      () => Navigator.of(context).pushReplacementNamed(InfoScreen.routeName)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(children: [
            SizedBox(width: size.width*0.1, ),
          Image.asset("assets/SPOTHOLE.png", 
            width: size.width*0.8, 
            height: size.height*0.8,
            fit: BoxFit.contain,
          ),
          ],)
        ],
      ),
    );
  }
}