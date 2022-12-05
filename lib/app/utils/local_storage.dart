import 'package:hive_flutter/hive_flutter.dart';

class AppCache {
  static String kUserBox = 'userBox';
  static const String tokenKey = 'tokenKeyrgewr';
  static const String gridKey = 'gridKeywrrgewr';

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(kUserBox);
  }

  static Box<dynamic> get _userBox => Hive.box<dynamic>(kUserBox);

  static void setToken(String a) {
    _userBox.put(tokenKey, a);
  }

  static String? getToken() {
    return _userBox.get(tokenKey);
  }

  static void setGridType(bool a) {
    _userBox.put(gridKey, a);
  }

  static bool getGridType() {
    return _userBox.get(gridKey, defaultValue: true);
  }

  static Future<void> clear() async {
    await _userBox.clear();
  }

  static void clean(String key) {
    _userBox.delete(key);
  }
}
