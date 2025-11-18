import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {

  static Future<Future<bool>> sharedPreferenceStorage(bool value) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.setBool("isLogin", value);
  }

}