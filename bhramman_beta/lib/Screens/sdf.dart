
import 'package:bhrammanbeta/resource/color.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';

class Ess extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.keyboard_backspace,color: black,size: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                  child: Text('Essence Of Indore',style: TextStyle(color: black,fontWeight: FontWeight.bold,fontFamily: 'sf_pro_regular',fontSize: 28),),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          CarouselSlider(
            height: 500.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16/9 ,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
            items: [
              Container(
                margin: EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/food.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Food',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'sf_pro_bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        shadows: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0.0, 0.0))],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Lorem Ipsum is simply dummy text use for printing and type script',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/garba.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Garba',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'sf_pro_bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        shadows: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0.0, 0.0))],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Lorem Ipsum is simply dummy text use for printing and type script',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: AssetImage('assets/images/history.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'History',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'sf_pro_bold',
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        shadows: [BoxShadow(color: Colors.black,blurRadius: 5,offset: Offset(0.0, 0.0))],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Lorem Ipsum is simply dummy text use for printing and type script',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
      floatingActionButton:
        FloatingActionButton(
          child: Icon(
            Icons.add,
            color: white,
          ),
        ),

    );
  }
}
