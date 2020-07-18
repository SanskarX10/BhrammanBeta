import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImagesOnTapNearBy extends StatefulWidget {
  @override
  _ImagesOnTapNearByState createState() => _ImagesOnTapNearByState();
}

class _ImagesOnTapNearByState extends State<ImagesOnTapNearBy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 8.0,
        children: <Widget>[
         Container(
           height: 120,
           width: 120,
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/nearing/tajone.png'),
            )
           ),
         ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/nearing/tajone.png'),
                )
            ),
          ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/nearing/tajone.png'),
                )
            ),
          ),      Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/nearing/tajone.png'),
                )
            ),
          ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/nearing/tajone.png'),
                )
            ),
          ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/nearing/tajone.png'),
                )
            ),
          ),

          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/nearing/tajone.png'),
                )
            ),
          ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/nearing/tajone.png'),
                )
            ),
          ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/nearing/tajone.png'),
                )
            ),
          ),



        ],
      ),
    );
  }
}