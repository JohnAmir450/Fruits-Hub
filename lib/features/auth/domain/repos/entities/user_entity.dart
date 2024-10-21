import 'package:firebase_auth/firebase_auth.dart';

class UserEntity {
   String? email;
   String? name;
   String? uId;
  UserEntity({required this.email, required this.name, required this.uId});


  UserEntity.fromFirebase(User user){
    email = user.email!;
    name = user.displayName!;
    uId = user.uid;
  }
  toMap() {
    return {
      'email': email,
      'name': name,
      'uId': uId,
    };
  }
}
