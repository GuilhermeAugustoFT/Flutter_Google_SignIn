import 'package:flutter/material.dart';
import 'package:project/models/User.dart';
import 'package:project/pages/home.dart';
import 'package:project/pages/login.dart';
import 'package:project/pages/splash.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Google SignIn",
      routes: {
        "/splash": (context) => SplashPage(),
        "/login": (context) => LoginPage(),
        "/home": (context) =>
            HomePage(user: ModalRoute.of(context)!.settings.arguments as User),
      },
      initialRoute: "/splash",
    );
  }
}
