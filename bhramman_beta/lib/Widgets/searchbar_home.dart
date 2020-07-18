import 'package:flutter/material.dart';

class SearchBarHome extends StatefulWidget {
  @override
  _SearchBarHomeState createState() => _SearchBarHomeState();
}

class _SearchBarHomeState extends State<SearchBarHome> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
      child: Material(
        elevation: 12,
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          height: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Row(
                children: <Widget>[
                  SizedBox(width: 8,),
                  Icon(
                    Icons.search,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width/2,
                    child: TextField(
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.start,
                      decoration: InputDecoration(
                        hintText: 'Search Places..',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: <Widget>[
                  Container(
                    width: 1,
                    height: 30,
                    color: Colors.black26,
                  ),
                  SizedBox(width: 8.0,),
                  Image(
                    height: 28.0,
                    width: 28.0,
                    color: Colors.blueAccent,
                    image: AssetImage('assets/images/aiii.png'),
                  ),
                  SizedBox(width: 15.0,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
