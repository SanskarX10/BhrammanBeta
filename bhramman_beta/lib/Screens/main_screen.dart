import 'dart:ui';

import 'package:bhrammanbeta/Screens/profile.dart';
import 'package:bhrammanbeta/data/data.dart';
import 'package:bhrammanbeta/database/firestore.dart';
import 'package:bhrammanbeta/resource/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'chat.dart';
import 'home_page.dart';

class MainScreen extends StatefulWidget {
  final pages = [HomePage(city: "Delhi",state: " ",),Profile(),Chat()];
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  Widget currentPage;
  int currentindex=0;

  List<Widget> pages;
  HomePage homePage;

  String currentCityName = "Delhi";
  String currentStateName = " ";




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePage=HomePage(city: currentCityName,state:currentStateName);
    pages=[homePage];
    currentPage=homePage;

    getLocation();





  }





  void getLocation() async {

    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude,localeIdentifier:AutofillHints.location);
    print(placemark[0].subAdministrativeArea);
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

      body:widget.pages[currentindex],
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