
import 'package:bhrammanbeta/resource/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnTapNearMid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: <Widget>[
            //first Row------------------------------------------------------
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //address//////////////
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Address',style: TextStyle(
                        fontSize: 20,
                        color: blueGreen,
                        fontWeight: FontWeight.bold
                      ),),
                      Text("Dharmapuri Tajganj,"
                          +"\n"+"Agra Tajganj,Agra UP",style: TextStyle(
                          fontSize: 16,
                          color: black
                      ),)
                    ],
                  ),
//  timing.............
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Timing',style: TextStyle(
                          fontSize: 20,
                          color: blueGreen,
                        fontWeight: FontWeight.bold
                       ),),
                      Text("open"
                          ,style: TextStyle(
                          fontSize: 16,
                          color: black,
                       ),),

                      Text("10:00 AM"
                         ,style: TextStyle(
                        fontSize: 16,
                        color: black,
                       ),),
                      Text("close",style: TextStyle(
                        fontSize: 16,
                          color: black,
                       ),),
                      Text("06:00 PM",style: TextStyle(
                        fontSize: 16,
                          color: black,
                      ),),
                    ],
                  )
                ],
              ),
            ),
            //-----------------------------------------------------------
            //second column
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //1.culture
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Culture',style: TextStyle(
                          fontSize: 20,
                          color: blueGreen,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                      Text("Hinduism",style: TextStyle(
                        fontSize: 16,
                        color:black,
                      ),),
                      Text("Hinduism",style: TextStyle(
                        fontSize: 16,
                          color:black,
                      ),),
                      Text("Hinduism",style: TextStyle(
                        fontSize: 16,
                          color:black,
                      ),),
                      Text("Hinduism",style: TextStyle(
                        fontSize: 16,
                          color:black,
                      ),),
                      Text("Hinduism",style: TextStyle(
                        fontSize: 16,
                          color:black,
                      ),),

                    ],
                  ),

                  //2 food
                  //------------------
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text('Food',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: blueGreen,
                      ),),
                      SizedBox(height: 3,),
                      Text("Petha",style: TextStyle(
                        fontSize: 16,
                          color:black,
                      ),),
                      SizedBox(height: 3,),
                      Text("Paratha",style: TextStyle(
                        fontSize: 16,
                          color:black,
                      ),),
                      SizedBox(height: 3,),
                      Text("Bhalla",style: TextStyle(
                        fontSize: 16,
                          color:black,
                      ),),

                      SizedBox(height: 3,),
                      Text("Dalmoth",style: TextStyle(
                        fontSize: 16,
                          color:black,

                      ),),
                      SizedBox(height: 2,),
                    ],
                  )
                ],
              ),
            ),
//------------------------------------------------------------------------
            SizedBox(height: 5,),
          ],
        ),
      ),
    );
  }
}
