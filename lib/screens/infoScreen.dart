import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'dart:math';

import 'package:spothole/screens/homeScreen.dart';

class InfoScreen extends StatefulWidget {

  static const routeName = "/info";

  static const style = TextStyle(
    fontSize: 30,
    fontFamily: "Billy",
    fontWeight: FontWeight.w600,
  );

  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreen createState() => _InfoScreen();
}

class _InfoScreen extends State<InfoScreen> {
  
  int page = 0;
  late LiquidController liquidController;
  late UpdateType updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  final pages = [
    Container(
      color: const Color(0xff720e2d),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Image.asset(
          //   'assets/1.png',
          //   fit: BoxFit.cover,
          // ),
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: const <Widget>[
              Text(
                "Introducing",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                "Spothole",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          ),
        ],
      ),
    ),

    Container(
      color: const Color(0xffdc6f76),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Image.asset(
          //   'assets/1.png',
          //   fit: BoxFit.cover,
          // ),
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: const <Widget>[
              Text(
                "Get the data",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                "of roads",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Text(
                "on one click",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          ),
        ],
      ),
    ),

    Container(
      color: const Color(0xffd1ad96),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          // Image.asset(
          //   'assets/1.png',
          //   fit: BoxFit.cover,
          // ),
          const Padding(
            padding: EdgeInsets.all(20.0),
          ),
          Column(
            children: const <Widget>[
              Text(
                "Plan your trip",
                style: InfoScreen.style,
              ),
              Text(
                "according to the",
                style: InfoScreen.style,
              ),
              Text(
                "data",
                style: InfoScreen.style,
              ),
            ],
          ),
        ],
      ),
    ),

    Container(color: const Color(0xffd1ad96),),
  ];

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return SizedBox(
      width: 25.0,
      child: Center(
        child: Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: SizedBox(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe(
              pages: pages,
              slideIconWidget: const Icon(Icons.arrow_back_ios),
              onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              enableSideReveal: true,
              ignoreUserGestureWhileAnimating: true,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(pages.length-1, _buildDot),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: FlatButton(
                  onPressed: () {
                    liquidController.animateToPage(
                        page: pages.length - 1, duration: 700);
                  },
                  child: const Text("Skip to End"),
                  color: Colors.white.withOpacity(0.01),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: FlatButton(
                  onPressed: () {
                    liquidController.jumpToPage(
                        page:
                            liquidController.currentPage + 1 > pages.length - 1
                                ? liquidController.currentPage
                                : liquidController.currentPage + 1);
                  },
                  child: const Text("Next"),
                  color: Colors.white.withOpacity(0.01),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
    if(lpage==(pages.length-1)){
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    }
  }
}