import 'file:///D:/FlutterProjects/bhramman_beta/bhramman_beta/lib/Screens/video/videos.dart';
import 'package:bhrammanbeta/Screens/live_stream.dart';
import 'package:bhrammanbeta/Screens/switch_section.dart';
import 'package:bhrammanbeta/Widgets/exploreCards.dart';
import 'package:bhrammanbeta/data/live_stream_data.dart';
import 'package:bhrammanbeta/database/firestore.dart';
import 'package:bhrammanbeta/resource/color.dart';
import 'package:flutter/material.dart';

import 'chat_bot.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  DatabaseService databaseService = DatabaseService();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            ),
            height: 250,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(blurRadius: 5,color:Colors.black26,offset: Offset(0.0,3.0))],
              color: white,
              borderRadius: BorderRadius.only(
                  bottomRight: const Radius.circular(25.0),
                  bottomLeft: const Radius.circular(25.0)),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/images/explore.png'
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          //one
          //---------------------------------------------------


          ExploreCard(
              image: 'assets/images/videos.png',
              title: "Videos" ,
              subTitle: " " ,
              titleColor: white,
              onTapWidget: Videos()
          ),


          //two
          //------------------------------------------

          ExploreCard(
              image: 'assets/images/chatbotimgtwo.png',
              title: "ChatBot" ,
              subTitle: "(Q/A)" ,
              titleColor: white,
              onTapWidget: ChatBot()
          ),



          ExploreCard(
              image: 'assets/images/livestream.png',
              title: "Live streming " ,
              subTitle: "(videos)" ,
              onTapWidget: LiveStream(),
              titleColor: Colors.black
          ),

          ExploreCard(
            image: "assets/images/livestream.png",
            titleColor: black,
            subTitle: " ",
            title: "Switch",
            onTapWidget: SwitchSection(),
          )

        ],
      ),
    );
  }


}
