import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/custom_exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/domain/repos/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/entities/user_model.dart';

class AuthRepoImpl extends AuthRepo{
  final FirebaseAuthService firebaseAuthService;
  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({required String email, required String password,required String name}) async{
    try {
  var user= await firebaseAuthService.createUserWithEmailAndPassword(email: email, password: password);
  return right(UserModel.fromFirebase(user));
} on CustomException catch (e) {
  return left(ServerFailure(message: e.message));
} catch (e) {
  log('There was an Exception in createUserWithEmailAndPassword: ${e.toString()}');
  return left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
}
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({required String email, required String password})async {
    
   try {
  var user =await firebaseAuthService.signInWithEmailAndPassword(email: email, password: password);
  return right(UserModel.fromFirebase(user));
} on CustomException catch (e) {
  return left(ServerFailure(message: e.message));
}catch (e) {
  log('There was an Exception in createUserWithEmailAndPassword: ${e.toString()}');
  return left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
}
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async{
    try {
  var user =await firebaseAuthService.signInWithGoogle();
  return right(UserModel.fromFirebase(user));
} on CustomException catch (e) {
  return left(ServerFailure(message: e.message));
}catch (e) {
  log('There was an Exception in signInWithGoogle: ${e.toString()}');
  return left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
}
  }
  
  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async{
    try {
  var user =await firebaseAuthService.signInWithFacebook();
  return right(UserModel.fromFirebase(user));
} on Exception catch (e) {
  log('There was an Exception in signInWithFacebook: ${e.toString()}');
  return left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
}
  }
}