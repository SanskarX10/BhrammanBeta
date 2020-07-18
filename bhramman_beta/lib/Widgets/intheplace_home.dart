import 'dart:ui';
import 'package:bhrammanbeta/data/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExtraOfHome extends StatefulWidget {
  @override
  _ExtraOfHomeState createState() => _ExtraOfHomeState();
}

class _ExtraOfHomeState extends State<ExtraOfHome> {
  Data data;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //second card
        //----------------------------------------------------
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),

            ),
            height: 180,
            width: 350,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/food.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 0.0, sigmaY: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0)),
                      ),
                    ),
                    height: 180,
                    width: 350,
                  ),
                  Center(
                    child: Text("Food", style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        shadows: [BoxShadow(blurRadius: 10,color: Colors.black54,offset: Offset(0.0,0.0))],
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ),

        //second card
        //----------------------------------------------------
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),

            ),
            height: 180,
            width: 350,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/history.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 0.0, sigmaY: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0)),
                      ),
                    ),
                    height: 180,
                    width: 350,
                  ),
                  Center(
                    child: Text("History", style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        shadows: [BoxShadow(blurRadius: 10,color: Colors.black54,offset: Offset(0.0,0.0))],                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ),
        //----------------------------------------------------------
        //third card..
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
            ),
            height: 180,
            width: 350,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/abouttheplace.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX:  0.0, sigmaY: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0)),
                      ),
                    ),
                    height: 180,
                    width: 350,
                  ),
                  Center(
                    child: Text("About", style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        shadows: [BoxShadow(blurRadius: 10,color: Colors.black54,offset: Offset(0.0,0.0))],                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ),
        //----------------------------------------------------------
        //four card..
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),

            ),
            height: 180,
            width: 350,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/food.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                          sigmaX: 0.0, sigmaY: 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0)),
                      ),
                    ),
                    height: 180,
                    width: 350,
                  ),
                  Center(
                    child: Text("Language", style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        shadows: [BoxShadow(blurRadius: 10,color: Colors.black54,offset: Offset(0.0,0.0))],                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
