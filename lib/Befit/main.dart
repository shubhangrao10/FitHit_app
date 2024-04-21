

import 'package:BeFit/Befit/UI/Login%20and%20Signup/Login%20page.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'Service/Firebase.dart';
import 'UI/Home/Homepage.dart';
import 'UI/Login and Signup/Splash screen.dart';
import 'models/Theme provider/theme provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Themeprovider()),
      Provider<Firebaseauth_method>(
          create: (_) => Firebaseauth_method(FirebaseAuth.instance,)),
      StreamProvider(create: (context)=> context.read<Firebaseauth_method>().authState, initialData: null)
    ],
    child: Befit(),
  ));
}

class Befit extends StatefulWidget {
  @override
  State<Befit> createState() => _BefitState();
}

class _BefitState extends State<Befit> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: Provider.of<Themeprovider>(context).themedata,
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final Firebaseuser = context.watch<User?>();

    if (Firebaseuser != null){
      return  Home();
    }
    return  Loginpage();
  }
}
