import 'dart:ui';

import 'package:bhrammanbeta/Screens/profile/profile.dart';

import 'essence/essence.dart';

import 'package:bhrammanbeta/data/data.dart';
import 'package:bhrammanbeta/database/auth.dart';
import 'package:bhrammanbeta/database/firestore.dart';
import 'package:bhrammanbeta/resource/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'ar_lens.dart';

import 'explore.dart';
import 'home_page.dart';

class MainScreen extends StatefulWidget {


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {



  String currentCityName = "Indore";
  String currentStateName = "Madhya Pradesh";



   final List<Widget> _widgetOptions = <Widget>[
     HomePage(),
     Explore(),
     ArLens(),
     Essence(),
     Profile(),
  ];

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  void getLocation() async {

    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude,position.longitude,localeIdentifier:AutofillHints.location);
     setState(() {
       if(placemark[0].subAdministrativeArea == 'Dewas'){
         currentCityName = "Indore";
         currentStateName = "Madhya Pradesh";
       }
       else if(placemark[0].subAdministrativeArea == "Ghaziabad") {
         currentCityName = "Delhi";
         currentStateName = "New Delhi";
       }
       else if(placemark[0].subAdministrativeArea == 'Jaipur') {
         currentCityName = "Jaipur";
         currentStateName="Rajasthan";
       }
       else if(placemark[0].subAdministrativeArea == 'Indore') {
         currentCityName = "Indore";
         currentStateName = "Madhya Pradesh";
       }
       else if(placemark[0].subAdministrativeArea == 'Satna' || placemark[0].subAdministrativeArea == 'Bina') {
         currentCityName = "Indore";
         currentStateName = "Madhya Pradesh";
       }
       else if(placemark[0].administrativeArea == 'Rajasthan'){
         currentCityName = "Jaipur";
         currentStateName = "Rajasthan";
       }

     });
     await AuthService.saveCurrentLocationSharedPref( currentCity :  currentCityName, currentState:  currentStateName);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.lightBlue,
        selectedLabelStyle: TextStyle(color: blueGreen,fontWeight: FontWeight.w700),
        unselectedItemColor:black,
        unselectedLabelStyle: TextStyle(color: black,fontWeight: FontWeight.w700),
        showUnselectedLabels: true,
        currentIndex:  _selectedIndex,
        onTap: _onItemTapped,

        items: [
          BottomNavigationBarItem(
            icon:Icon(Icons.home,),
            title:Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title:Text("Explore"),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            title:Text("AI LENS"),
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.local_florist),
              title: Text("Essence",)

          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            title:Text("Profile"),
          ),



        ],
      ),

      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}



