import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../main.dart';



class screen1 extends StatefulWidget {
  const screen1({super.key});

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor:Colors.blueAccent,
      body:
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 60),
              child: RichText(
                  text: TextSpan(
                      text: "IT'S NOT"
                          " ABOUT "
                          "HAVING TIME,"
                          "IT'S ABOUT "
                          "MAKING TIME "
                          "TO ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 54),
                      children: [
                    TextSpan(
                        text: "BeFit",
                        style: GoogleFonts.pacifico(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 54,
                           ))
                  ])),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60,
              ),
              child: MaterialButton(
                  height: 45,
                  color: Colors.black,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AuthWrapper()));
                  },
                  child: Text(
                    "Start your journey",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),

    );
  }
}
