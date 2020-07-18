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
  
  



}

