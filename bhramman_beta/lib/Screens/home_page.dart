import 'package:bhrammanbeta/Screens/about_city.dart';
import 'package:bhrammanbeta/Screens/food.dart';
import 'package:bhrammanbeta/Widgets/culture_home.dart';
import 'package:bhrammanbeta/Widgets/in_place_cards.dart';

import 'package:bhrammanbeta/Widgets/monuments.dart';
import 'package:bhrammanbeta/Widgets/searchbar_home.dart';
import 'package:bhrammanbeta/Widgets/topof_home.dart';
import 'package:bhrammanbeta/data/about_city_data.dart';
import 'package:bhrammanbeta/database/auth.dart';
import 'package:bhrammanbeta/database/firestore.dart';
import 'package:bhrammanbeta/resource/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../data/data.dart';
import 'package:flutter/widgets.dart';

import 'best_places.dart';
import 'login.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DatabaseService data = new DatabaseService();
  AuthService _authService = new AuthService();

  String topImageUrl = "https://cdn.britannica.com/86/170586-050-AB7FEFAE/Taj-Mahal-Agra-India.jpg";


  String city="Delhi",state="New Delhi";

  bool loading = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    getLocation();

     getFullData();

  }

  getFullData() async {
    setState(() {
      loading  = true;
    });
    await getImage();
    await getMonuments();
    await getCulture();
    await getFestivals();
    await getCityData();
    setState(() {
      loading  = false;
    });
  }

  DatabaseService databaseService = DatabaseService();

  AboutCityData cityData;
  getCityData() async{
    await databaseService.getCityDataFirebaseFireStore(city: "Delhi").then((value) {
      setState(() {
        cityData =  value;
      });
    });
  }


//  getLocation() async{
//    await AuthService.getCurrentCitySharedPref().then((value) {
//        setState(() {
//          city = value.toString();
//        });
//    });
//
//    await AuthService.getCurrentStateSharedPref().then((value){
//       setState(() {
//          state = value.toString();
//       });
//    });
//  }

  List <Data> monuments = new List();
   getMonuments() async {
    await Firestore.instance.collection("Places").document(city).collection("Monuments")
        .getDocuments().then((querySnapshot) {

       querySnapshot.documents.forEach((element) {

        List images = element.data['images'];
        Map longDesc = element.data['longDescription'];

        monuments.add(
            Data(
                imageUrl: images[0],
                place: element.data['monumentName'].toString(),
                images: images,
                location: element.data['location'].toString(),
                shortdescription: element.data['shortDescription'].toString(),
                history: longDesc['history'].toString(),
                entryFee: element.data['entryFee'],
                about: longDesc['aboutThePlace'].toString(),
                city: element.data['city'].toString(),
            )
        );
      });
    });
  }


  List <Data> cultureAndFestival = new List();
 getCulture() async {
    await Firestore.instance.collection("Places").document(city).collection("Culture")
        .getDocuments().then((querySnapshot) {

      querySnapshot.documents.forEach((element) {
        List images = element.data['images'];
        Map longDesc = element.data['longDescription'];

        cultureAndFestival.add(
            Data(
              imageUrl: images[0],
              place: element.data['cultureName'].toString(),
              images: images,
              shortdescription: element.data['shortDescription'].toString(),
              history: longDesc['history'].toString(),
              about: longDesc['about'].toString(),
              typeOfThing: "Culture",
              city: element.data['city'].toString(),
            )
        );
      });
    });
  }


  getFestivals() async {
    await Firestore.instance.collection("Places").document(city).collection("Festivals")
        .getDocuments().then((querySnapshot) {

      querySnapshot.documents.forEach((element) {
        List images = element.data['images'];
        Map longDesc = element.data['longDescription'];

        cultureAndFestival.add(
            Data(
              imageUrl: images[0],
              place: element.data['festivalName'].toString(),
              images: images,
              typeOfThing: "Festival",
              shortdescription: element.data['shortDescription'].toString(),
              history: longDesc['history'].toString(),
              about: longDesc['about'].toString(),
              city: element.data['city'].toString(),
            )
        );
      });
    });
  }



  getImage() async{
     await Firestore.instance.collection("Places").document(city).get().then((value){
       setState(() {
           topImageUrl = value.data['mainImage'].toString();
       });
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading == false ?  Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: <Widget>[
                //staring text
                TopOfHome(topImageUrl: topImageUrl,cityName: "Delhi", stateName: "New Delhi",),
                //search bar
                SearchBarHome(),
                SizedBox(height: 20,),

                //text of near by u
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Monuments',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontFamily: 'sf_pro_bold',
                            color: black),
                      ),
                      Text(
                        'View all',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'sf_pro_regular',
                            color: grey),
                      ),
                    ],
                  ),
                ),
                //near by u .....

               ForYou(monuments),


                SizedBox(height: 30.0,),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Local Culture',
                        style: TextStyle(
                            fontSize: 22.0,
                            fontFamily: 'sf_pro_bold',
                            color: black),
                      ),
                      Text(
                        'View all',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontFamily: 'sf_pro_regular',
                            color: grey),
                      ),
                    ],
                  ),
                ),

                Culture(cultureAndFestival),
                SizedBox(height: 30.0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'In Place',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontFamily: 'sf_pro_bold',
                            color: black),
                      ),
                      Text(
                        'View all',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'sf_pro_regular',
                            color: lightGrey),
                      ),
                    ],
                  ),
                ),

                InPlaceCard(imageUrl:'assets/images/food.webp', name: "Food",onTapWidget: Food(city : city),),

                InPlaceCard(imageUrl:'assets/images/best_place.jpg', name: "Best Places",onTapWidget: BestPlaces(city: city,),),

                InPlaceCard(imageUrl:'assets/images/about.jpg', name: "About",onTapWidget: AboutCity(city: city,cityData: cityData,),),


                SizedBox(height: 12.0,),

                RaisedButton(
                  onPressed: () async{
                   await FirebaseAuth.instance.signOut().then((value){
                      AuthService.saveUserLoggedInSharedPref(false);
                      Navigator.pushReplacement(context, MaterialPageRoute(
                         builder:  (context) => Login()
                      ));

                   });
                  },
                  child: Text("Log out"),
                ),

              ],
            ),
          ),
        ),
      )
          : Shimmer.fromColors(
           baseColor: grey, highlightColor: lightGrey,
           child: ShimmerLayout(),
        )
    );
  }
}

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double containerWidth = 200;
    double containerHeight = 15;

    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.symmetric(vertical: 7.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(6, (index) {
            return Container(
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: containerHeight,
                        width: containerWidth,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: containerHeight,
                        width: containerWidth,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: containerHeight,
                        width: containerWidth * 0.75,
                        color: Colors.grey,
                      )
                    ],
                  )


                ]
              )

            );

          }),
        ),
      ),
    );
  }
}
