import 'package:dartz/dartz.dart';
import 'package:fruit_hub/features/auth/domain/repos/entities/user_entity.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      {required String email, required String password, required String name});
  
  Future<Either<Failure,UserEntity>>signInWithEmailAndPassword({required String email, required String password,});

  Future<Either<Failure,UserEntity>> signInWithGoogle();

  Future<Either<Failure,UserEntity>> signInWithFacebook();

  Future addUserData({required UserEntity user });

  Future saveUserData({required UserEntity user });
  Future<UserEntity> getUserData({ required String uId});
  }
