import 'package:bhrammanbeta/Screens/on_tap_essence.dart';
import 'package:bhrammanbeta/Screens/on_tap_monuments.dart';
import 'package:bhrammanbeta/Screens/sdf.dart';
import 'package:bhrammanbeta/data/essence_data.dart';
import 'package:bhrammanbeta/database/firestore.dart';
import 'package:bhrammanbeta/resource/color.dart';
import 'package:flutter/material.dart';

class Essence extends StatefulWidget {


  @override
  _EssenceState createState() => _EssenceState();
}

class _EssenceState extends State<Essence> {


  DatabaseService  _databaseService =  DatabaseService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEssenceData();
  }




  List<EssenceData> essenceData = new List();

  getEssenceData() async {
    await _databaseService.getEssenceDataFirebaseFireStore(city: "Delhi").then((value) {

      setState(() {
        essenceData =  value;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(


       appBar: AppBar(
         backgroundColor:white,

         title: Text("Essence" , style: TextStyle(color: Colors.lightBlue,fontFamily: 'normal_font',fontWeight: FontWeight.bold,fontSize: 30),),
         elevation: 0,

       ),


        body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
          child: Container(

          height: MediaQuery.of(context).size.height,
            child:  Row(
            children: List.generate(essenceData.length, (index) {
             return  GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> OnTapEssence(essenceData: essenceData[index])
                  ));
                },
                child: Card(
                    shape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),

                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                            height:550,
                            width: 300,
                            child:Stack(
                              children: [

                                Opacity(
                                  opacity: 0.3,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: black,
                                      borderRadius: BorderRadius.all(Radius.circular(10)),

                                    ),

                                  ),
                                ),

                                Container(
                                  height: 550,
                                  width: 300,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(essenceData[index].images[0]),
                                    ),
                                  ),
                                ),


                                Container(

                                  child: Positioned(

                                    bottom: 8.0,

                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.all(10),

                                          width: 300,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                essenceData[index].heritageName,
                                                style: TextStyle(
                                                    color: white,
                                                    fontFamily: 'sf_pro_bold',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16.0),
                                              ),

                                              Text(
                                                essenceData[index].city,
                                                style: TextStyle(
                                                    color: white,
                                                    fontSize: 16.0),
                                              ),

                                              Row(
                                                children: <Widget>[
                                                  Icon(Icons.star,
                                                      color: Colors.orange, size: 15.0),
                                                  Icon(Icons.star,
                                                      color: Colors.orange, size: 15.0),
                                                  Icon(Icons.star,
                                                      color: Colors.orange, size: 15.0),
                                                  Icon(Icons.star,
                                                      color: Colors.orange, size: 15.0),
                                                  Icon(Icons.star,
                                                      color: Colors.white, size: 15.0),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),



                              ],
                            )
                        ),
                      ],
                    )
                ),
              );
            })
          )
        ),
      )
    );
  }
}
//SingleChildScrollView(
//scrollDirection: Axis.vertical,
//child: Stack(
//children : [
//Column(
//children: <Widget>[
//Container(
//width: MediaQuery.of(context).size.width,
//child: Padding(
//padding:
//const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//child: Column(
//crossAxisAlignment: CrossAxisAlignment.end,
//mainAxisAlignment: MainAxisAlignment.end,
//children: <Widget>[
//
//Row(
//children: <Widget>[
//Text(
//'Essence Of Delhi',
//style: TextStyle(
//fontFamily: 'sf_pro_bold',
//color: white,
//shadows: [BoxShadow(color: black,blurRadius: 5,offset: Offset(0.0, 0.0))],
//fontSize: 35),
//),
//SizedBox(width: 5,),
//Icon(
//Icons.location_on,
//color: white,
//size: 25,
//)
//],
//),
//],
//),
//),
//height: 250,
//decoration: BoxDecoration(
//color: black,
//borderRadius: BorderRadius.only(
//bottomRight: const Radius.circular(25.0),
//bottomLeft: const Radius.circular(25.0)),
//
//image: DecorationImage(
//fit: BoxFit.cover,
//image: AssetImage(
//'assets/images/essence.jpg',
//),
//),
//),
//),
//SizedBox(height: 10,),
////one
////---------------------------------------------------
//Column(
//crossAxisAlignment: CrossAxisAlignment.center,
//mainAxisAlignment: MainAxisAlignment.center,
//children: List.generate(essenceData.length, (index)  {
//return  Padding(
//padding:
//const EdgeInsets.symmetric(horizontal: 7.5, vertical: 5),
//child: GestureDetector(
//onTap:(){
//
//Navigator.push(context, MaterialPageRoute(
//builder: (context) => OnTapEssence(essenceData: essenceData[index], city:essenceData[index].city),
//));
//
//},
//child: Container(
//height: 200,
//width:  MediaQuery.of(context).size.width,
//child: Stack(
//children: <Widget>[
//Positioned(
//left: 0.0,
//bottom: 0.0,
//right: 0.0,
//child: Container(
//height: 80,
//width: MediaQuery.of(context).size.width,
//decoration: BoxDecoration(
//borderRadius: BorderRadius.circular(20),
//gradient: LinearGradient(
//colors: [Colors.black, Colors.black12],
//begin: Alignment.bottomCenter,
//end: Alignment.topCenter,
//),
//),
//),
//),
//Padding(
//padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//child: Column(
//mainAxisAlignment: MainAxisAlignment.end,
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Text(
//essenceData[index].heritageName,
//style: TextStyle(
//fontSize: 18,
//fontFamily: 'sf_pro_bold',
//
//color: Colors.white),
//),
//Padding(
//padding: const EdgeInsets.symmetric(
//horizontal: 2, vertical: 10),
//child: Container(
//height: 1,
//width: MediaQuery.of(context).size.width / 1.5,
//color: lightGrey,
//),
//),
//Row(
//children: <Widget>[
//Icon(Icons.star,
//color: Colors.yellow, size: 15.0),
//Icon(Icons.star,
//color: Colors.yellow, size: 15.0),
//Icon(Icons.star,
//color: Colors.yellow, size: 15.0),
//Icon(Icons.star,
//color: Colors.yellow, size: 15.0),
//Icon(Icons.star,
//color: Colors.white, size: 15.0),
//Text('('+'4.5'+')Rating',style: TextStyle(color: lightGrey,fontSize: 14,fontFamily: 'sf_pro_regular'),),
//],
//),
//],
//),
//),
//],
//),
//decoration: BoxDecoration(
//color: white,
//borderRadius: BorderRadius.circular(20),
//image: DecorationImage(
//fit: BoxFit.cover,
//image:NetworkImage(essenceData[index].images[0]),
//),
//),
//),
//),
//);
//})
//),
//],
//),
//
////app bar//
//Positioned(
//child: AppBar(
//backgroundColor: Colors.transparent,
//elevation: 0,
//),
//),
//
//]
//),
//),