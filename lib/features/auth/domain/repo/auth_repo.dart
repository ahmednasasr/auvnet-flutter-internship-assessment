import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entitys/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password,String name);

  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password);

  Future adduser({required UserEntity user});
  Future saveUserData({required UserEntity user});

  Future <UserEntity>getUserData({required String uId});
}
