import 'package:cloud_firestore/cloud_firestore.dart';

class Data{
  String imageUrl;
  List images;
  String city;
  String location;
  String place;
  String shortdescription;
  String history;
  String about;
  String country;
  double rating;
  String culName;
  String imageUrlTwo;
  String cardName;
  String cardUrl;

  Data(
      {
        this.imageUrl,
        this.location,
        this.images,
        this.city,
        this.place,
        this.shortdescription,
        this.country,
        this.rating,
        this.culName,
        this.imageUrlTwo,
        this.cardName,
        this.cardUrl,
        this.about,
        this.history,
      }
    );
}

