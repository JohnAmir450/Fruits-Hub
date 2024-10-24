import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruit_hub/core/errors/custom_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {

  Future deleteUser() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      throw CustomException(message: mapException(e));
    } catch (e) {
      log('there was an Exception from Firebase Auth Service: ${e.toString()}');
      throw CustomException(message: 'حدث خطأ ما، حاول مرة اخرى');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
       log('there was an Exception from Firebase Auth Service: ${e.toString()}');
      throw CustomException(message: mapException(e));
      
    } catch (e) {
      log('there was an Exception from Firebase Auth Service: ${e.toString()}');
      throw CustomException(message: 'حدث خطأ ما، حاول مرة اخرى');
    }
  }
Future <User> signInWithGoogle()async{
final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
}
Future<User> signInWithFacebook()async{
  final LoginResult result = await FacebookAuth.instance.login();
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(result.accessToken!.tokenString);
  return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
} 
bool isLoggedIn(){
  return FirebaseAuth.instance.currentUser!=null;
}
}