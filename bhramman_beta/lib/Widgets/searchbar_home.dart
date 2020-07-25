
import 'package:bhrammanbeta/resource/color.dart';
import 'package:flutter/material.dart';
import 'package:bhrammanbeta/Screens/search_screen.dart';

class SearchBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
//      child: Material(
//        elevation: 12,
//        borderRadius: BorderRadius.circular(10.0),
//        child: GestureDetector(
//          onTap: (){
//            Navigator.push(context, MaterialPageRoute(
//              builder: (context)=> SearchScreen(),
//            ));
//          },
//          child: Container(
//            height: 45,
//            width: double.infinity,
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[
//
//                Row(
//                  children: <Widget>[
//                    SizedBox(width: 8,),
//                    Icon(
//                      Icons.search,
//                    ),
//                    SizedBox(
//                      width: 5.0,
//                    ),
//                    Container(
//                      width: MediaQuery.of(context).size.width/2,
//                      child: Text("Search")
//                    ),
//                  ],
//                ),
//
//                Row(
//                  children: <Widget>[
//                    Container(
//                      width: 1,
//                      height: 30,
//                      color: Colors.black26,
//                    ),
//                    SizedBox(width: 8.0,),
//                    Image(
//                      height: 28.0,
//                      width: 28.0,
//                      color: Colors.blueAccent,
//                      image: AssetImage('assets/images/aiii.png'),
//                    ),
//                    SizedBox(width: 15.0,)
//                  ],
//                ),
//              ],
//            ),
//          ),
//        ),
//      ),
//    );

      return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(

            builder: (context) => SearchScreen(),

          ));
        },
        child: Container(
           padding: EdgeInsets.all(8),
           margin: EdgeInsets.only(left: 20,right: 20),
           height: 45,
           width: MediaQuery.of(context).size.width/1,
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10.0),
             color: white,
             boxShadow: [
               BoxShadow(
                 color: Colors.grey.withOpacity(0.5),
                 spreadRadius: 5,
                 blurRadius: 7,
                 offset: Offset(0, 3), // changes position of shadow
               ),
             ],
           ),

          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Search City"),
              Icon(Icons.search),
            ],
          ),

        ),
      );

  }
}

