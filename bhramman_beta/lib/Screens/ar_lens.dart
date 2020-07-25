import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ArLens extends StatefulWidget {
  @override
  _ArLensState createState() => _ArLensState();
}

class _ArLensState extends State<ArLens> {



  File file;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


void showSnackBar(String message) {
  _scaffoldKey.currentState.showSnackBar(SnackBar(content : Text(message)));
}


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Center(
          child: Container(
            child: Column(
              children: [
                Container(
                  child: file!=null ?  GestureDetector(
                    onTap: (){
                      detectLabels();
                    },
                    child: Image(
                      image: FileImage(
                        file,
                      ),
                    ),
                  ) : Container(),

                ),

                Container(
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      pickImage();
                    },
                    child: Text("Pick A Image"),
                  ),
                ),

                Container(
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        file = null;
                      });
                    },
                    child: Text("Remove Image"),
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );



  }

  Future<void> pickImage() async{
   final imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);


   setState(() {
     file = imageFile;
   });

  }


  Future<void> detectLabels() async {
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(file);
    final ImageLabeler imageLabeler = FirebaseVision.instance.cloudImageLabeler();

    final List<ImageLabel> labels = await imageLabeler.processImage(visionImage);


    for(ImageLabel label in labels) {
      print(label.text);

    }

  }


}
