import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Screen/Activity tracker.dart';
import '../../Screen/Calender/calendar.dart';
import '../../Screen/Daily workout/daily workout.dart';
import '../../Screen/Health tips/Health tips.dart';
import '../../Screen/Progress_gallery.dart';
import '../../Screen/Sleep tracker.dart';
import '../../Screen/Water Traker.dart';
import '../../Screen/Workout screen/Advanced workout.dart';
import '../../Screen/Workout screen/Beginner workout.dart';
import '../../Screen/Workout screen/Intermediate workout.dart';
import '../../Service/Firebase.dart';



class Homescreen extends StatefulWidget {


  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {


  @override
  Widget build(BuildContext context) {
    final user = context.read<Firebaseauth_method>().user;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // backgroundColor: Colors.white,
          title: Text(
            "Be Fit",
            style: GoogleFonts.pacifico(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              // color: Colors.black,
            ),
          ),
          elevation: 0,

          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Calender()));
                  },
                  child: Icon(
                    Icons.calendar_month_sharp,
                    color: Colors.blueAccent.shade700,
                    size: 40,
                  )),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                  "Hello ${user.displayName!},",
                    style: GoogleFonts.merriweather(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      // color: Colors.black
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Elevate your fitness. Start your journey now !",
                    style: GoogleFonts.merriweather(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      // color: Colors.black
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 1.7,
                      enlargeCenterPage: true,
                    ),
                    items: [
                      GestureDetector(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "asset/Images/10-simple-nutrition-tips.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HealthTipPage(),
                              ));
                        },
                      ),
                      GestureDetector(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "asset/Images/img_2.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => dailyworkout(),
                                ));
                          }),
                    ]),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Lifestyle Monitor",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Box(
                        "Sleep tracking",
                        Icons.bedtime_outlined,
                        Colors.redAccent.shade400,
                        SleepTrackerScreen(),
                      ),
                      Box(
                        "Water Intake",
                        Icons.water_drop_outlined,
                        Colors.blueAccent.shade400,
                        WaterIntakeScreen(),
                      ),
                      Box(
                        "Progress Gallery",
                        Icons.add_a_photo_outlined,
                        Colors.orange.shade500,
                        Progress_gallery(),
                      ), // Customize this box
                      Box(
                        "Activity Tracker",
                        Icons.directions_run,
                        Colors.purple.shade500,
                        ActivityTrackerScreen(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "Workout section",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: 26),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => beginner()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade300),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "BEGINNERS",
                              style: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                            Text(
                              "For Weight Loss",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              "30 Days",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => intermediate()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade500),
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "INTERMEDIATE",
                              style: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                            Text(
                              "For Fat Loss",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              "30 Days",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => advance()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue.shade700),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ADVANCED",
                              style: TextStyle(
                                  fontSize: 45,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                            Text(
                              "For Toned Body",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              "30 Days",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Widget Box(String title, IconData icon, Color color, Widget screen) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Container(
        height: 150,
        width: 150,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
