import 'package:flutter/cupertino.dart';
import 'package:project/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  var response;

  Future<void> saveUser(User user, BuildContext context) async {
    //salva o usuário nas SharedPreferences
    final instance = await SharedPreferences.getInstance();
    instance.setString("userPractice", user.toJson());
    Navigator.of(context).pushReplacementNamed("/home", arguments: user);
  }

  Future<void> logoutUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    instance.remove("userPractice");
    Navigator.of(context).pushReplacementNamed("/splash");
  }

  Future<void> verifyUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    if (instance.containsKey("userPractice")) {
      await Future.delayed(Duration(seconds: 3));
      final json = instance.get("userPractice") as String;
      saveUser(User.fromJson(json), context);
    } else {
      await Future.delayed(Duration(seconds: 3));
      Navigator.of(context).pushReplacementNamed("/login");
    }
  }

  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        "email",
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user = User(
        name: response!.displayName!,
        email: response.email,
        photoURL: response.photoUrl!,
      );
      saveUser(user, context);
    } catch (e) {
      print(e);
    }
  }
}
