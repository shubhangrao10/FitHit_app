
import 'package:flutter/material.dart';


import 'Account.dart';
import 'Home screen.dart';



class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,

      bottomNavigationBar: BottomNavigationBar(

          selectedItemColor: Colors.blueAccent.shade400,
          unselectedItemColor: Colors.black54,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.shifting,
          onTap: (tapindex) {
            setState(() {
              _currentIndex = tapindex;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account")
          ]),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(_currentIndex),
        ),
      ),
    );
  }
}

_getPage(int page) {
  switch (page) {
    case 0:
      return Homescreen();
    case 1:
      return Settings();

  }
}
