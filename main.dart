import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bm2elektrik_app/screens/Landing_Page.dart';



void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        accentColor: Color(0xFFFF1E00)
      ),
      home: LandingPage(),
    );
  }
}

