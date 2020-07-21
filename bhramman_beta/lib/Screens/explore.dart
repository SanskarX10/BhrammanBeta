import 'package:bhrammanbeta/resource/color.dart';
import 'package:flutter/material.dart';

import 'chat_bot.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.keyboard_backspace,
                    color: black,
                    size: 25,
                  ),
                ],
              ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GestureDetector(
              onTap: () {
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>OnTapCardCulture()));
              },
              child: GestureDetector(
                onTap: (){
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OnTapOfVideos()));
                },
                child: Container(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text('Videos',style: TextStyle(color: white,fontWeight: FontWeight.bold,
                            fontFamily: 'sf_pro_bold',fontSize: 25),),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: white,
                    boxShadow: [BoxShadow(color:Colors.black12,blurRadius: 10,offset: Offset(0.0,0.0),)],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/videos.png')
                    ),
                  ),
                ),
              ),
            ),
          ),
          //two
          //------------------------------------------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatBot()));
              },
              child: Container(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        'ChatBot',
                        style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'sf_pro_bold',
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                      Text(
                        '(Q/A)',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'sf_pro_semibold',
                            color: white),
                      ),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [BoxShadow(color:Colors.black12,blurRadius: 10,offset: Offset(0.0,0.0),)],
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/chatbotimgtwo.png'),
                  ),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GestureDetector(
              onTap: () {
//                Navigator.push(context, MaterialPageRoute(builder: (context)=>OnTapCardCulture()));
              },
              child: GestureDetector(
                onTap: (){
//                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LiveStreamOnTap()));
                },
                child: Container(
                  height: 200,
                  child: Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: AssetImage('assets/images/livestream.png')
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 9,bottom: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text('Live streaming',style: TextStyle(color: black,fontWeight: FontWeight.bold,
                                fontFamily: 'sf_pro_bold',fontSize: 25),),
                            Text(' (videos)',style: TextStyle(color: black,
                                fontFamily: 'sf_pro_semi_bold',fontSize: 20),),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: white,

                    boxShadow: [BoxShadow(color:Colors.black12,blurRadius: 10,offset: Offset(0.0,0.0),)],
                    borderRadius: BorderRadius.circular(20),
//                  image: DecorationImage(
//                    image: AssetImage('assets/images/livestream.png')
//                  ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
