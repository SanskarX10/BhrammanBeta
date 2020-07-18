import 'package:bhrammanbeta/Widgets/culture_home.dart';
import 'package:bhrammanbeta/Widgets/intheplace_home.dart';
import 'package:bhrammanbeta/Widgets/nearbyu_home.dart';
import 'package:bhrammanbeta/Widgets/searchbar_home.dart';
import 'package:bhrammanbeta/Widgets/topof_home.dart';
import 'package:bhrammanbeta/database/firestore.dart';
import 'package:bhrammanbeta/resource/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../data/data.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {

  final String city,state;


  HomePage({this.city,this.state});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  DatabaseService data = new DatabaseService();

  String topImageUrl = "https://cdn.britannica.com/86/170586-050-AB7FEFAE/Taj-Mahal-Agra-India.jpg";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImage();
    getMonuments();
    getCulture();
  }

  List <Data> monuments = new List();
  void getMonuments() async {
    await Firestore.instance.collection("Places").document("Delhi").collection("Monuments")
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
                about: longDesc['aboutThePlace'].toString(),

            )
        );
      });
    });
  }


  List <Data> culture = new List();
  void getCulture() async {
    await Firestore.instance.collection("Places").document("Delhi").collection("Culture")
        .getDocuments().then((querySnapshot) {

      querySnapshot.documents.forEach((element) {

        List images = element.data['images'];

        culture.add(
            Data(
                imageUrl: images[0],
                place: element.data['cultureName'].toString(),
                images: images
            )
        );
      });
    });
  }



  getImage() async{
     await Firestore.instance.collection("Places").document(widget.city).get().then((value){
       setState(() {
           topImageUrl = value.data['mainImage'].toString();
       });
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: <Widget>[
                //staring text
                TopOfHome(topImageUrl: topImageUrl,cityName: "Delhi", stateName: " ",),
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
                        'For you',
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
                        'Cultural Events',
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

                CulturalEvents(culture),
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

                ExtraOfHome(),
                SizedBox(height: 12.0,),
              ],
            ),
          ),
        ),
      )
    );
  }
}
