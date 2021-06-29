import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uber/AllScreens/get_startedscreen.dart';
import 'package:uber/AllScreens/loginscreen.dart';
import 'package:uber/AllScreens/mainscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
DatabaseReference usersRef=FirebaseDatabase.instance.reference().child("users");
//  String finalEmail;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uber',
      theme: ThemeData(
        fontFamily: "Brand Bold`",
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        
        // splash: Image.asset(
        //   'images/black_logo.png',
        //   ),
        splash: Text('Uber', style: TextStyle(
          fontSize: 50.0,
          fontFamily: "Uber Move",
          color: Colors.white,
          //fontWeight: FontWeight.w100,
          letterSpacing: 2.0,
        ),
        ),
          nextScreen: MainScreen(),
          splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.black,
          duration: 3000,
      ),
    );
  }
}
