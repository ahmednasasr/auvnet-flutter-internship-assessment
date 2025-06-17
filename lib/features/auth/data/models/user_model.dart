import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entitys/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.email, required super.uId});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
        name: user.displayName ?? "", email: user.email ?? "", uId: user.uid);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json["name"], email: json["email"], uId: json["uid"]);
  }

  toMap() {
    return {
      'name': name,
      'email': email, // تم تصحيح الفاصلة إلى نقطتين
      'uid': uId,
    };
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(name: user.name, email: user.email, uId: user.uId);
  }
}
