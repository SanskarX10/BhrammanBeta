
import 'package:bhrammanbeta/resource/color.dart';
import 'package:flutter/material.dart';

class ReviewsNearBy extends StatefulWidget {
  @override
  _ReviewsNearByState createState() => _ReviewsNearByState();
}

class _ReviewsNearByState extends State<ReviewsNearBy> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        //---------------------------------
        //this input field for commentss....
        Container(
          height: 40.0,
          child: TextField(
            style: TextStyle(
              fontSize: 20.0,
            ),
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.send,color:lightGrey,size: 18,),
              contentPadding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color:grey),),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: lightGrey),
              ),
              hintText: 'write your views about place',
            ),
          ),
        ),
        //---------------------------------
        //this Row is used to show comment or rating...
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/manone.png'),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width/1.6,
                decoration: BoxDecoration(
                  color: blueGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Text('Rama Chandan tiddi',style: TextStyle(fontWeight: FontWeight.bold,color: black,fontSize: 20),),
                    Text('ksdjfklfjksjfkl;fjkalfjak;sljflk;sajfkl'+"\n"+';asjfksjfkl;sajfkdsjfksjfk;lsfjkdfjsakf'+"\n"+';asjfksjfkl;sajfkdsjfksjfk;lsfjkdfjsakf'+"\n"+';asjfksjfkl;sajfkdsjfksjfk;lsfjkdfjsakf',style: TextStyle(color: Colors.black,fontSize: 18),),
                  ],),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
