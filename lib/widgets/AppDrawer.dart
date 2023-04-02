import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spothole/screens/homeScreen.dart';
import 'package:spothole/screens/mapScreen.dart';
import 'package:spothole/screens/profileScreen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double unitHeightValue = size.height * 0.01;
    double multiplier = 2.5;
    
    return SafeArea(
      child: ListTileTheme(
          textColor: Theme.of(context).primaryColor,
          iconColor: Theme.of(context).primaryColor,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: size.width*0.4,
                height: size.height*0.2,
                margin: const EdgeInsets.only(
                  top: 24.0,
                  bottom: 64.0,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/SPOTHOLE.png',
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
                leading: const Icon(Icons.home, size:35),
                title: Text(
                  'Home',
                  style: GoogleFonts.josefinSans(
                    textStyle: Theme.of(context).textTheme.headline2,
                    color: Theme.of(context).primaryColor,
                    fontSize: multiplier * unitHeightValue,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(ProfileScreen.routeName);
                },
                leading: const Icon(Icons.account_circle_rounded, size:35),
                title: Text('Profile',
                  style: GoogleFonts.josefinSans(
                    textStyle: Theme.of(context).textTheme.headline2,
                    color: Theme.of(context).primaryColor,
                    fontSize: multiplier * unitHeightValue,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushNamed(MapScreen.routeName);
                },
                leading: const Icon(Icons.map_rounded, size:35),
                title: Text('Map',
                  style: GoogleFonts.josefinSans(
                    textStyle: Theme.of(context).textTheme.headline2,
                    color: Theme.of(context).primaryColor,
                    fontSize: multiplier * unitHeightValue,
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.info, size:35),
                title: Text('About',
                  style: GoogleFonts.josefinSans(
                    textStyle: Theme.of(context).textTheme.headline2,
                    color: Theme.of(context).primaryColor,
                    fontSize: multiplier * unitHeightValue,
                  ),
                ),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text(
                    'Terms of Service | Privacy Policy',
                    style: GoogleFonts.josefinSans(
                      textStyle: Theme.of(context).textTheme.headline2,
                      color: Theme.of(context).cursorColor,
                      fontSize: multiplier * unitHeightValue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}