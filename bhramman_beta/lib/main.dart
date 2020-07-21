import 'package:bhrammanbeta/Screens/main_screen.dart';
import 'package:bhrammanbeta/database/auth.dart';
import 'package:bhrammanbeta/resource/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'Screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool loggedIn = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLogIn();
  }

  checkLogIn() async {
    await FirebaseAuth.instance.currentUser().then((value){
       if(value.uid != null  ) {
         setState(() {
           loggedIn = true;
         });
       }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: loggedIn ? MainScreen() : Login()
    );
  }
}
