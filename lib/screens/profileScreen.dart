import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {

  static const routeName = "/profile";

  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.person,
          size: 46,  
          color: Color(0xff333333),
        ),
        title: Text(
          "Profile",
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
      body: Column(
        children: const [
          Text("Data"),
        ],
      ),
    );
  }
}