import 'package:bhrammanbeta/resource/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OnTapNearBy extends StatefulWidget {
  @override
  _OnTapNearByState createState() => _OnTapNearByState();
}

class _OnTapNearByState extends State<OnTapNearBy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/nearing/newtaj.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GestureDetector(
              onTap: (){Navigator.pop(context);},
              child: Icon(
                Icons.keyboard_backspace,
                color: white,
                size: 30,
              ),
            ),
            SizedBox(height: 50,),
            Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: <Widget>[
                Text('Taj Mahal',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:white),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Agra, Up ',style: TextStyle(fontSize: 18,color:lightGrey),),
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
