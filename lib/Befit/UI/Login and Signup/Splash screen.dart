
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Screen 1.dart';



class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 8), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => screen1()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("asset/Images/icon.png.png"),
             SizedBox(height: 10),
             Text(
              "BeFit",
              style: GoogleFonts.pacifico(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
