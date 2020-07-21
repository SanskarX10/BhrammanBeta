import 'dart:collection';

import 'package:bhrammanbeta/data/about_city_data.dart';
import 'package:bhrammanbeta/data/best_places.dart';
import 'package:bhrammanbeta/data/essence_data.dart';
import 'package:bhrammanbeta/data/food_data.dart';
import 'package:bhrammanbeta/data/review_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  Firestore db = Firestore.instance;


  Future<dynamic> createUserInDatabase({String email, String userId,String name,String profilePic,String phone}) async{
    try {
      await db.collection('Users').document(userId).setData({
        'email':email,
        'name':name,
        'profilePic':profilePic,
        'phone':phone,
      });
    }
    catch(e) {
       print(e.toString());
    }

  }


  Future<dynamic> getUserDataFromFireStore({String userId}) async{
     List<String> userData;

     await db.collection("Users").document(userId).get().then((value){

         userData.add(value.data['name']);
         userData.add(value.data['profilePic']);
         return userData;

     });

  }
  
   Future<dynamic> saveUserReviewToFireStore({String userId, String city,
     String typeOfThing, String name,String review,String userName,String profilePic,double userRating}) async{


    var time = DateTime.now();
    var hour = time.hour;
    var minute  = time.minute;
    var day = time.day.toString() + "/" + time.month.toString() + "/" + time.year.toString();


    await db.collection("Places").document(city).collection(typeOfThing).document(name).collection("Reviews").
         document().setData({
        "review" : review,
        "userName": userName,
        "timeStamp":Timestamp.now(),
         "time" : "$hour:$minute",
         "date":day,
         "profilePic" :profilePic,
         'rating' : userRating,
    });
  }


  Future <dynamic> getUserReviewsFromFireStore({String city, String typeOfThing,String name}) async{
    List<ReviewData> reviewData = new List();
    var totalRating = 0.0;
    Map<dynamic,dynamic> data = new HashMap();

      await db.collection("Places").document(city).collection(typeOfThing).document(name).collection("Reviews").orderBy("timeStamp",descending: true)
    .getDocuments().then((querySnapShots) {



        querySnapShots.documents.forEach((element) {

           totalRating = totalRating + element.data['rating'];

           reviewData.add(
             ReviewData(
               review: element.data['review'].toString(),
               userName: element.data['userName'].toString(),
               profilePic: element.data['profilePic'].toString(),
               date:element.data['date'].toString(),
               time: element.data['time'].toString(),
               rating: totalRating,
               currentRating:element.data['rating'],

             )
           );
        });

        totalRating = totalRating/querySnapShots.documents.length;



     });
    data = {"reviewData" : reviewData , "totalRating" : totalRating};

    return data;



  }
  
  Future<dynamic> getFoodDataFromFireStore({String city}) async{
    List<FoodData> foodData = new List();
    await db.collection("Places").document(city).collection("Food").getDocuments().then(
        (querySnapShots) {
            querySnapShots.documents.forEach((element) {

              List images = element.data['images'];
              Map longDesc = element.data['longDescription'];


                foodData.add(
                  FoodData(
                    city: element.data['city'],
                    foodName: element.data['foodName'],
                    images: images,
                    about: longDesc['aboutFood'],
                    famousPlace: longDesc['famousPlace'],
                    other: longDesc['other'],
                    shoreDescription:  element.data['shortDescription'],
                  )
                );
            });
        });

     return foodData;

  }


  Future<dynamic> getBestPlacesDataFireStore({String city}) async{
    List<BestPlacesData> placesData = new List();
    await db.collection("Places").document(city).collection("SpecialPlaces").getDocuments().then(
            (querySnapShots) {
          querySnapShots.documents.forEach((element) {

            List images = element.data['images'];
            Map longDesc = element.data['longDescription'];


            placesData.add(
                BestPlacesData(
                  city: element.data['city'],
                  place: element.data['placeName'],
                  images: images,
                  about: longDesc['about'],
                  history: longDesc['history'],
                  shortDescription:  element.data['shortDescription'],
                  latitude: element.data['latitude'],
                  longitude: element.data['longitude'],
                  location: element.data['location'],
                )
            );
          });
        });

    return placesData;

  }

  Future<dynamic> getCityDataFirebaseFireStore({String city}) async{
    AboutCityData cityData;
    await db.collection("Places").document(city).get().then((value) {

       cityData = AboutCityData(
          city: value.data['city'],
          longitude: value.data['longitude'],
          latitude:  value.data['latitude'],
          description: value.data['shortDescription'],
           about: value.data['about'],
           images:  value.data['images'],
           history: value.data['history'],

       );

    });

    return cityData;
  }

  Future<dynamic> getEssenceDataFirebaseFireStore({String city}) async{
    List<EssenceData> essenceData = new List();
    await db.collection("Places").document(city).collection("IntangibleHeritage").getDocuments().then(
            (querySnapShots) {

              querySnapShots.documents.forEach((element) {

                essenceData.add(
                    EssenceData(
                      city: element.data['city'],
                      description: element.data['description'],
                      images: element.data['images'],
                      heritageName: element.data['heritageName'],
                    )
                );
              });
            });

    return essenceData;



  }



}

