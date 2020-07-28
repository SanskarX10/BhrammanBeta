import 'dart:io';


import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:panorama/panorama.dart';

class ArLens extends StatefulWidget {
  @override
  _ArLensState createState() => _ArLensState();
}

class _ArLensState extends State<ArLens> {

  File file;

  @override
  Widget build(BuildContext context) {
    return SafeArea(


      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          child: Icon(Icons.camera_enhance),
          onPressed: ()async{
           File image  =  await ImagePicker.pickImage(source: ImageSource.camera);

           setState(() {
             file  = File(image.path);
           });

          },
        ),
        body : Center(
          child: Panorama(
             child: Image(
               image: file == null ?  AssetImage('assets/images/three.jpg') : FileImage(file),
             ),
          ),
        )
      ),
    );



  }




}
