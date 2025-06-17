import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  static final HiveService _instance = HiveService._internal();

  factory HiveService() => _instance;

  HiveService._internal();

  static const String _userBoxName = 'userBox';
  static const String _userNameKey = 'userName';

  late Box _userBox;

  Future<void> init() async {
    await Hive.initFlutter();
    _userBox = await Hive.openBox(_userBoxName);
  }

  Future<void> saveUserName(String name) async {
    await _userBox.put(_userNameKey, name);
  }

  String? get userName => _userBox.get(_userNameKey);

  bool get hasUser => _userBox.containsKey(_userNameKey);

  Future<void> clearUserName() async {
    await _userBox.delete(_userNameKey);
  }
}
