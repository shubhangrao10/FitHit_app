import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Service/Firebase.dart';
import 'Login page.dart';

class Register3 extends StatefulWidget {
  const Register3({Key? key}) : super(key: key);

  @override
  State<Register3> createState() => _Register3State();
}

class _Register3State extends State<Register3> {
  var username_controller = TextEditingController();
  var password_controller = TextEditingController();
  var email_controller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  String? email;
  String? password;
  String? name;

  @override
  void dispose() {
    super.dispose();
    email_controller.dispose();
    password_controller.dispose();
  }



  void signUpUser() async {
    print("Signing up user...");
    try {
      await context.read<Firebaseauth_method>().Signupemail(
            email: email_controller.text,
            password: password_controller.text,
            name: username_controller.text,
            context: context,
      );

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Loginpage()));
      print("Sign up successful!");
    } catch (e) {
      print("Error during sign up: $e");
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body:Form(
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
                "Create your Account",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(color: Colors.white),
                controller: username_controller,
                validator: (name) {
                  if (name!.isEmpty) {
                    return "Add your name";
                  } else
                    return null;
                },
                onSaved: (ename) {
                  name = ename;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white24,
                  hintText: "Full name",
                  hintStyle: const TextStyle(color: Colors.white),
                  labelText: "What's your name ?",
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(Icons.person),
                  suffixIconColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(color: Colors.white),
                validator: (email1) {
                  if (email1!.isEmpty &&
                      !email1.contains("@") &&
                      !email1.contains(".")) {
                    return "Enter your Email id";
                  } else
                    return null;
                },
                onSaved: (mail) {
                  email = mail;
                },
                controller: email_controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white24,
                  hintText: "Enter your Email",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "Email Address",
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(Icons.email),
                  suffixIconColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: TextFormField(
                textInputAction: TextInputAction.next,
                style: TextStyle(color: Colors.white),
                controller: password_controller,
                obscuringCharacter: '*',
                obscureText: true,
                validator: (pass) {
                  if (pass!.isEmpty || pass.length < 6) {
                    return "password must greater than 6";
                  } else {
                    return null;
                  }
                },
                onSaved: (pwd) {
                  password = pwd;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white24,
                  hintText: "Create a password",
                  hintStyle: TextStyle(color: Colors.white),
                  labelText: "password",
                  labelStyle: TextStyle(color: Colors.white),
                  suffixIcon: Icon(Icons.password),
                  suffixIconColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: MaterialButton(
                  color: Colors.pink,
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  onPressed: signUpUser,
                  child: Text("Register")),
            ),
            SizedBox(height: 10),


          ],
        ))
      ]),
    ));
  }
}
