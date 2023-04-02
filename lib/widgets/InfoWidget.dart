import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoWidget extends StatelessWidget {

  final int number;
  final String tex;

  const InfoWidget({ 
    required this.number,  
    required this.tex,
    Key? key 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height*0.6,
      child: Column(
        children: [
          SizedBox(
            width: size.width*0.3,
            child: Text(
              number.toString(), 
              style: GoogleFonts.josefinSans(
                textStyle: Theme.of(context).textTheme.headline2,
                color: Theme.of(context).backgroundColor,
                fontSize: 42
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: size.height*0.02,),
          SizedBox(
            width: size.width*0.35,
            child: Text(
              tex, 
              style: GoogleFonts.josefinSans(
                textStyle: Theme.of(context).textTheme.headline2,
                color: Theme.of(context).backgroundColor
              ),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}