import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:spothole/widgets/AppDrawer.dart';
import '../widgets/InfoWidget.dart';
import './mapScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    final _advancedDrawerController = AdvancedDrawerController();

    return AdvancedDrawer(
      backdropColor: Theme.of(context).cardColor,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54,
            blurRadius: 1.0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.blue
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.location_pin,
            size: 46,  
            color: Color(0xff333333),
          ),
          title: Text(
            "SpotHole",
            style: GoogleFonts.raleway(
              letterSpacing: 0.3,
              textStyle: Theme.of(context).textTheme.headline1,
              color: Theme.of(context).cardColor,
            ),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          toolbarHeight: 90,
          elevation: 20,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height*0.02,),
              Image.asset(
                "assets/stats.png",
                height: size.height*0.35,
              ),
              SizedBox(height: size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.data_usage_rounded,
                    size: 36,  
                    color: Color(0xffffffff),
                  ),
                  SizedBox(width: size.width*0.03,),
                  Text(
                    "Pothole Data",
                    style: GoogleFonts.josefinSans(
                      textStyle: Theme.of(context).textTheme.headline2,
                      color: Theme.of(context).backgroundColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 32
                    )
                  ),
                ],
              ),
              SizedBox(height: size.height*0.05,),
              SizedBox(
                height: size.height*0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const InfoWidget(number: 250, tex: "Spotted in India"),
                    SizedBox(width: size.width*0.2,),
                    const InfoWidget(number: 101, tex: "Reported in Mumbai"),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Align(
          alignment: const Alignment(0.22,0.82),
          child: FloatingActionButton.extended(
            onPressed: (){
              Navigator.of(context).pushNamed(MapScreen.routeName);
            },
            extendedPadding: const EdgeInsets.all(30),
            icon: const Icon(
              Icons.location_on_rounded,
              size: 30,
              color: Color(0xff333333),
            ),
            label: Text(
              "Open Map",
              style: GoogleFonts.josefinSans(
                textStyle: Theme.of(context).textTheme.headline2,
                color: Theme.of(context).cursorColor,
                fontSize: 20,
                fontWeight: FontWeight.w400
              ),
            ),
            tooltip: "Map to view Potholes",
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}