import 'package:bhrammanbeta/database/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  FirebaseAuth _auth  = FirebaseAuth.instance;
  DatabaseService databaseService = DatabaseService();
  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future registerWithEmailAndPassword({String email,String password,String name, String phone})async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser user  = result.user;
      await databaseService.createUserInDatabase(email: email,userId:user.uid,name: name,profilePic: 'kdjfkd',phone: phone);
      return user.uid;

    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future<FirebaseUser> googleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(idToken:googleAuth.idToken,
        accessToken: googleAuth.accessToken);

    AuthResult result = await _auth.signInWithCredential(credential);
    FirebaseUser user  = result.user;
    await databaseService.createUserInDatabase(email: user.email,userId:user.uid,name: user.displayName,profilePic: user.photoUrl,phone: user.phoneNumber);
    return user;
  }



  Future signInUserWithEmailAndPassword(String email, String password) async{
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser user  = result.user;
      return user.uid;
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }



}




