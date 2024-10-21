import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/custom_exceptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/shared_prefrences_singlton.dart';
import 'package:fruit_hub/core/utils/backend_endpoints.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/domain/repos/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/entities/user_model.dart';

import '../../../core/utils/constants.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(email: email, name: name, uId: user.uid);
      await addUserData(user: userEntity);
      await getUserData(uId: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('There was an Exception in createUserWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(user: userEntity);
      log(userEntity.name.toString());
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      log('There was an Exception in createUserWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebase(user);
      var isUserExist = await databaseService.checkIfDataExists(
        documentId: user.uid,
        path: BackendPoints.isUserExist,
      );
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('There was an Exception in signInWithGoogle: ${e.toString()}');
      return left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebase(user);
      var isUserExist = await databaseService.checkIfDataExists(
        documentId: user.uid,
        path: BackendPoints.isUserExist,
      );
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on Exception catch (e) {
      log('There was an Exception in signInWithFacebook: ${e.toString()}');
      return left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log('There was an Exception in signInWithFacebook: ${e.toString()}');
      return left(ServerFailure(message: 'حدث خطأ ما، حاول مرة اخرى'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendPoints.addUserData,
      data: user.toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
        path: BackendPoints.getUserData, documentId: uId);

    return UserModel.fromJson(userData);
  }
  
  @override
  Future saveUserData({required UserEntity user}) async {
    var userData= jsonEncode(user.toMap());
    await Prefs.setString(kSaveUserData, userData);
  }
}
