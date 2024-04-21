import 'dart:ui';

import 'package:BeFit/Befit/Service/Firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Screen/Forgot password.dart';
import 'Register page.dart';



class Loginpage extends StatefulWidget {
  @override
  State<Loginpage> createState() => _LoginpageState();
}


class _LoginpageState extends State<Loginpage> {
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController password_controller = TextEditingController();
  var formkey = GlobalKey<FormState>();




  void loginuser() {
    Firebaseauth_method(FirebaseAuth.instance).loginWithEmail(
        email: email_controller.text,
        password: password_controller.text,
        context: context);

  }


  @override
  Widget build(BuildContext context) {
    bool hidepass = true;
    return Scaffold(
        body:

        Form(
          key: formkey,
          child: Stack(children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("asset/Images/background.png"),
                    fit: BoxFit.cover,
                  )),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4), //blur intensity
                child: Container(
                  color: Colors.black.withOpacity(0.5), //opacity
                ),
              ),
            ),
            SafeArea(
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 80, left: 10),
                      child: Text(
                        "Login your Account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 50,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 70),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        validator: (text) {
                          if (text!.isEmpty ||
                              !text.contains('@') ||
                              !text.contains('.com')) {
                            return " Enter valid Email Address !!!";
                          }
                        },
                        controller: email_controller,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white24,
                          hintText: " Enter your email id",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white),
                          suffixIcon: Icon(Icons.email),
                          suffixIconColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                            BorderSide(color: Colors.white), // Change this line
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        validator: (pass) {
                          if (pass!.isEmpty || pass.length < 6) {
                            return "Password length should be greater than 6 ";
                          }
                        },
                        textInputAction: TextInputAction.next,
                        obscuringCharacter: "*",
                        obscureText: hidepass,
                        controller: password_controller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white24,
                          hintText: "Enter your password",
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: "password",
                          labelStyle: TextStyle(color: Colors.white),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (hidepass)
                                    hidepass = false;
                                  else
                                    hidepass = true;
                                });
                              },
                              icon: Icon(
                                  hidepass ? Icons.visibility : Icons
                                      .visibility_off)),
                          suffixIconColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                            BorderSide(color: Colors.white), // Change this line
                          ),

                          // enabledBorder: OutlineInputBorder(
                          //  borderSide: BorderSide(color: Colors.black)),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: MaterialButton(
                          color: Colors.pink,
                          textColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          onPressed: loginuser,
                          child: Text("Login")),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => forgotpass()));
                        },
                        child: Text(
                          "Forgot password ?",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context) => Register3()));
                        },
                        child: Text(
                          "Create a new Account ?",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),

                  ],
                )),
          ]),
        ));
  }
}
