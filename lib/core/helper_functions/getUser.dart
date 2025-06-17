import 'dart:convert';

import '../../features/auth/data/models/user_model.dart';
import '../../features/auth/domain/entitys/user_entity.dart';
import '../services/shared_preferences_singleton.dart';

UserEntity getUser() {
  var jsonString = Prefs.getString("UserData");
  var UserEntity = UserModel.fromJson(jsonDecode(jsonString));
  return UserEntity;

}