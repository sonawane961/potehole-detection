import 'package:flutter/material.dart';
import 'package:spothole/screens/homeScreen.dart';
import 'package:spothole/screens/infoScreen.dart';
import 'package:spothole/screens/profileScreen.dart';
import './screens/splashScreen.dart';
import './screens/mapScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spothole',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xffe5d4ff),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
          headline2: TextStyle(fontSize: 24, fontWeight: FontWeight.w300)
        ),
        canvasColor: const Color(0xff333333),
        backgroundColor: const Color(0xffe5d4ff),
        cardColor: const Color(0xff333333),
        accentColor: const Color(0xff7daa92),
        cursorColor: const Color(0xff333333)
      ),
      home: const SplashScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        MapScreen.routeName: (ctx) => const MapScreen(),
        InfoScreen.routeName: (ctx) => const InfoScreen(),
        ProfileScreen.routeName: (ctx) => const ProfileScreen(),
      },
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget!),
          maxWidth: 2200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(450, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(700, name: TABLET),
            const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
      ),
    );
  }
}
