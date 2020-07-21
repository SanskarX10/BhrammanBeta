import 'dart:ui';

import 'package:bhrammanbeta/Screens/essence.dart';
import 'package:bhrammanbeta/Screens/profile.dart';
import 'package:bhrammanbeta/data/data.dart';
import 'package:bhrammanbeta/database/auth.dart';
import 'package:bhrammanbeta/database/firestore.dart';
import 'package:bhrammanbeta/resource/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'ar_lens.dart';
import 'chat.dart';
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
    Essence(),
    ArLens(),
    Explore(),
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
        selectedItemColor: blueGreen,
        selectedLabelStyle: TextStyle(color: blueGreen,fontWeight: FontWeight.w700),
        unselectedItemColor:black,
        unselectedLabelStyle: TextStyle(color: black,fontWeight: FontWeight.w700),
        showUnselectedLabels: true,
        currentIndex:  _selectedIndex,
        onTap: _onItemTapped,

        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/home_icon.png'),),
            title:Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/essence_icon.png'),),
            title: Text("Essence",)

          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/lens_icon.png'),),
            title:Text("ArLens"),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/explore_icon.png'),),
            title:Text("Explore"),
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('assets/icons/profile_icon.png'),),
            title:Text("Explore"),
          ),



        ],
      ),

      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}



//CurvedNavigationBar(
//index: 0,
//color: Colors.white,
//buttonBackgroundColor: Colors.white,
//backgroundColor: Colors.blue,
//animationCurve: Curves.easeInOut,
//animationDuration: Duration(milliseconds: 300),
//onTap: (index){
//setState(() {
//currentindex=index;
//currentPage=pages[index];
//});
//
//},
//height: 60,
//items: [
//Icon(Icons.home),
//Icon(Icons.camera),
//Icon(Icons.chat),
//
//],
//)