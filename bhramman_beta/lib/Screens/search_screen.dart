import 'package:bhrammanbeta/resource/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {

    String searchText = '';

    return Scaffold(
       appBar: AppBar(
         backgroundColor: white,
         elevation: 0,
         iconTheme: IconThemeData(
           color: black,
         ),

         title:Container(
           height: 30,
           color: lightGrey,
           child: TextFormField(
             onChanged:(value) {
               setState(() {
                 searchText = value;
               });
             } ,
             decoration: InputDecoration(
               contentPadding: EdgeInsets.all(10),
               hoverColor: grey,
               border: InputBorder.none,
               hintText: "Search Something",
             ),
           ),
         ),

         actions: [
           Container(

             width: 50,
             margin: EdgeInsets.only(right: 10,top: 5,bottom: 5),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(50),
               color: lightGrey,
             ),
             child: IconButton(
              icon: Icon(
                Icons.mic,
                size: 24,
                color: black,
              ),
             ),
           )
         ],

       ),
      

    );
  }
}
