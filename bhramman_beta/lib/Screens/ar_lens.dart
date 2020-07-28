import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panorama/panorama.dart';

class ArLens extends StatefulWidget {
  @override
  _ArLensState createState() => _ArLensState();
}

class _ArLensState extends State<ArLens> {




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body : Center(
          child: Panorama(
             child: Image(
               image: AssetImage('assets/images/three.jpg'),
             ),
          ),
        )
      ),
    );



  }




}
