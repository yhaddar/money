import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/User.dart';
import '../utils/constant/sharedPreference.dart';

class AuthenticationViewmodel with ChangeNotifier {
  bool loading = false;
  late SharedPreferences sharedPreferences;

  Future<Map<String, dynamic>> login(UserModel user) async {
    loading = true;
    notifyListeners();

    try {
      loading = false;
      notifyListeners();

      final response = await Supabase.instance.client.auth.signInWithPassword(
          password: user.password, email: user.email);

      SharedPreference.sharedPreferenceStorage(true);
      return {
        "message": response,
        "status": 200
      };
    } on AuthApiException catch (e) {
      SharedPreference.sharedPreferenceStorage(false);
      return {
        "message": e.message,
        "status": 500
      };
    }
  }

  Future<Map<String, dynamic>> register(UserModel user) async {
    loading = true;
    notifyListeners();

    try {
      loading = false;
      notifyListeners();

      final response = await Supabase.instance.client.auth.signUp(
        password: user.password,
        email: user.email,
      );

      await Supabase.instance.client.from("users").insert({
        "user_id": response.user!.id,
        "full_name": user.fullName,
        "genre": user.genre
      });

      SharedPreference.sharedPreferenceStorage(true);
      return {
        "message": response.user!.id,
        "status": 200
      };

    } on AuthApiException catch (e) {
      SharedPreference.sharedPreferenceStorage(false);
      return {
        "message": e.message,
        "status": 500
      };
    }
  }

}