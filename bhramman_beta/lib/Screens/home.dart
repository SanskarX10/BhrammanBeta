import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String result;
  Home({ this.result});
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text(
            widget.result,
            style: TextStyle(

              fontSize: 18
            ),
          ),
        ),
    );
  }
}
