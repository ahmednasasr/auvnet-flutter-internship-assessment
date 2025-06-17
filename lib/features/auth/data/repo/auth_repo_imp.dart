import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/services/data_service.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/services/hive.dart';
import '../../../../core/services/shared_preferences_singleton.dart';
import '../../domain/entitys/user_entity.dart';
import '../../domain/repo/auth_repo.dart';
import '../models/user_model.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseauthService;
  final DatebaseService datebaseService;
  AuthRepoImp(this.firebaseauthService, this.datebaseService);

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    User? user;
    try {
      user = await firebaseauthService.createUserWithEmailAndPassword(
          email: email, password: password);
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await HiveService().saveUserName(name);

      // await adduser(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseauthService.deleteUser();
      }
      return left(serverFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signinWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseauthService.signInWithEmailAndPassword(
          email: email, password: password);
      String? name = await HiveService().userName;

      var userEntity = UserEntity(name: name??"",email: email, uId: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(serverFailure(e.message));
    }
  }

// to add user to our database after sign
  @override
  Future adduser({required UserEntity user}) async {
    await datebaseService.addData(
        ColoectionName: "users", data: UserModel.fromEntity(user).toMap(), documentId: user.uId);
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userDate = await datebaseService.getData(ColectionName: "users", uId: uId);
    return UserModel.fromJson(userDate as Map<String, dynamic>);
  }

  @override
  Future saveUserData({required UserEntity user}) async{
    var jsonData= jsonEncode(UserModel.fromEntity(user).toMap());

    await Prefs.setString("UserData", jsonData);
  }
}
