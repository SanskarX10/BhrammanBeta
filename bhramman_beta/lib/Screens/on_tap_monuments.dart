import 'dart:ui';


import 'package:bhrammanbeta/Widgets/ontap_nearbyyou/inside_nearby.dart';
import 'package:bhrammanbeta/Widgets/ontap_nearbyyou/nearbyontap_photos.dart';
import 'package:bhrammanbeta/Widgets/ontap_nearbyyou/ontapnearby_mid.dart';
import 'package:bhrammanbeta/Widgets/ontap_nearbyyou/review_part_nearby.dart';
import 'package:bhrammanbeta/data/data.dart';
import 'package:bhrammanbeta/resource/color.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
// ignore: must_be_immutable



class OnTapMonuments extends StatefulWidget {

  final Data activity;
  OnTapMonuments(this.activity);


  @override
  _OnTapMonumentsState createState() => _OnTapMonumentsState();
}

class _OnTapMonumentsState extends State<OnTapMonuments> {

  FlutterTts  textToSpeech = FlutterTts();

  bool clickedOverView = false;
  bool clickedAbout = false;
  bool clickedHistory = false;


  @override
  Widget build(BuildContext context) {

    Future speakShortDesc() async{
      if(clickedOverView == true) {
        await textToSpeech.speak(widget.activity.shortdescription);
        await textToSpeech.setPitch(1);
        await textToSpeech.setSpeechRate(0.8);
        await textToSpeech.setVoice("hi-in-x-hie-network");
        print(await textToSpeech.getVoices);
      }
      else{
        await textToSpeech.stop();
      }

    }

    Future speakHistory() async{
      if(clickedHistory == true) {
        await textToSpeech.speak(widget.activity.history);
        await textToSpeech.setPitch(1);
        await textToSpeech.setSpeechRate(0.8);
        await textToSpeech.setVoice("hi-in-x-hie-network");
        print(await textToSpeech.getVoices);
      }
      else{
        await textToSpeech.stop();
      }

    }

    Future speakAbout() async {
      if(clickedAbout == true) {
        await textToSpeech.speak(widget.activity.about);
        await textToSpeech.setPitch(1);
        await textToSpeech.setSpeechRate(0.8);
        await textToSpeech.setVoice("hi-in-x-hie-network");
        print(await textToSpeech.getVoices);
      }
      else{
        await textToSpeech.stop();
      }

    }



    return Scaffold(
      body: Container(
        //scroll view main
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          //main stack for app bar transparent///
          child: Stack(
            children: [
              //main Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //top stack . for slide show...
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.60,
                        width: MediaQuery.of(context).size.width,
                        child: Carousel(
                          boxFit: BoxFit.cover,
                          dotSize: 3,
                          dotBgColor: Colors.transparent,
                          autoplayDuration:Duration(milliseconds:3000),
                          images: [
                            NetworkImage(widget.activity.images[0]),
                            NetworkImage(widget.activity.images[1]),
                            NetworkImage(widget.activity.images[2])
                          ],
                        ),
                      ),
                      Opacity(
                        opacity: 0.3,
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.60,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                        ),
                      ),
                      Positioned(
                        top: 430,
                        left: 30,
                        child: Container(

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children : [
                                Text(
                                  widget.activity.place,
                                  style: TextStyle(
                                      color: white,
                                      fontFamily: 'sf_pro_bold',
                                      fontSize: 23
                                  ),
                                ),
                                Text(
                                  "Delhi",
                                  style: TextStyle(
                                      color: white,
                                      fontFamily: 'sf_pro_bold',
                                      fontSize: 16
                                  ),
                                )
                              ]
                          ),
                        ),
                      ),
                    ],

                  ),
                  //top stack . for slide show...

                  SizedBox(height: 30,),

                  //overview head///
                  Container(
                    padding: EdgeInsets.only(left: 15,right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Overview",
                          style: TextStyle(
                              fontSize: 25,
                              fontFamily: 'sf_pro_bold'
                          ),
                        ),

                        IconButton(
                          icon: Icon(clickedOverView ? Icons.stop : Icons.volume_up),
                          onPressed: (){
                           setState(() {
                             if(clickedOverView == false) {
                               clickedOverView = true;
                             }
                             else{
                               clickedOverView = false;
                             }
                           });
                            speakShortDesc();
                          },
                        ),
                      ],
                    )
                  ),
                  //overview head///

                  SizedBox(height: 10,),

                  //overview body short desc///
                  Container(
                    padding: EdgeInsets.only(left: 15,right: 15),
                    child: Text(
                      widget.activity.shortdescription,
                      style: TextStyle(
                        fontFamily: "sf_pro_semi_bold",
                        fontSize: 18
                      ),

                    ),

                  ),
                  //overview body short desc///

                 //overview body history and about//
                 ExpansionTile(
                   title: Text("More"),
                   initiallyExpanded: false,
                   children: [
                     Container(
                         padding: EdgeInsets.only(left: 15,right: 15),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(
                               "About",
                               style: TextStyle(
                                   fontSize: 20,
                                   fontFamily: 'sf_pro_bold'
                               ),
                             ),

                             IconButton(
                               icon: Icon(clickedAbout ?Icons.stop : Icons.volume_up),
                               onPressed: (){
                                 setState(() {
                                    if(clickedAbout == false) {
                                      clickedAbout = true;
                                    }
                                    else{
                                      clickedAbout = false;
                                    }
                                 });
                                 speakAbout();
                               },
                             ),
                           ],
                         ),
                     ),

                     Container(
                       padding: EdgeInsets.only(left: 15,right: 15),
                       child: Text(
                         widget.activity.about,
                         style: TextStyle(
                             fontFamily: "sf_pro_semi_bold",
                             fontSize: 18
                         ),

                       ),

                     ),

                     Container(
                       padding: EdgeInsets.only(left: 15,right: 15),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                             "History",
                             style: TextStyle(
                                 fontSize: 20,
                                 fontFamily: 'sf_pro_bold'
                             ),
                           ),

                           IconButton(
                             icon: Icon(clickedHistory ? Icons.stop : Icons.volume_up),
                             onPressed: (){
                               setState(() {
                                 if(clickedHistory == false) {
                                   clickedHistory = true;
                                 }
                                 else{
                                   clickedHistory = false;
                                 }
                               });
                               speakHistory();
                             },
                           ),
                         ],
                       ),
                     ),
                     Container(
                       padding: EdgeInsets.only(left: 15,right: 15),
                       child: Text(
                         widget.activity.history,
                         style: TextStyle(
                             fontFamily: "sf_pro_semi_bold",
                             fontSize: 18
                         ),

                       ),
                     ),
                   ],
                 ),
                  //overview body history and about//


                  SizedBox(height: 5,),

                  //Gallery .....
                  Container(
                      padding: EdgeInsets.only(left: 15,right: 15),
                      child: Text(
                        "Gallery",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'sf_pro_bold'
                        ),
                      )
                  ),

                  Container(
                    height: 260,
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 8.0,
                      children: List.generate(widget.activity.images.length, (index) {
                        return GestureDetector(
                          onTap: (){
                            print(index);
                          },
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(widget.activity.images[index]),
                                )
                            ),
                          ),
                        );
                      })

                    ),
                  ),
                  //Gallery ...../


                  SizedBox(height: 15,),


                  Container(
                      padding: EdgeInsets.only(left: 15,right: 15),
                      child: Text(
                        "Reviews",
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'sf_pro_bold'
                        ),
                      )
                  ),

                  SizedBox(height: 15,),


                  Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      children: <Widget>[
                        //---------------------------------
                        //this input field for commentss....
                        Container(
                          padding: EdgeInsets.only(left: 10,right: 10),
                          height: 80.0,
                          child: TextField(
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                            textAlignVertical: TextAlignVertical.center,
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.send,color:lightGrey,size: 18,),
                              contentPadding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color:grey),),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: lightGrey),
                              ),
                              hintText: 'What do you think about ${widget.activity.place}',
                              hintStyle: TextStyle(
                                fontSize: 18,
                              )
                            ),
                          ),
                        ),
                        //---------------------------------
                        //this Row is used to show comment or rating...
                        Container(
                          padding: const EdgeInsets.only(top: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/images/manone.png'
                                  ),
                                ),
                              ),

                              Container(
                                decoration: BoxDecoration(
                                  color: lightGrey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                          child: Text('Rama Chandan tiddi',
                                            style: TextStyle(
                                                color: black,
                                                fontSize: 18,
                                                fontFamily: "sf_pro_bold"
                                            ),
                                          )
                                      ),

                                      SizedBox(height: 5,),


                                      Container(
                                          width: MediaQuery.of(context).size.width*0.70,
                                          child: Text(
                                              '',
                                             style: TextStyle(
                                               fontFamily: "sf_pro_regular",
                                             ),
                                          )
                                      ),
                                    ],


                                  ),

                              ),



                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),

                ],
              ),


              //app bar//
              Positioned(
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
              ),
              //app bar//



            ],
          ),
        ),
      ),





    );
  }
}
