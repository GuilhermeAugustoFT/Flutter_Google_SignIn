import 'package:flutter/material.dart';
import 'package:project/controllers/authController.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final authController = AuthController();
    authController.verifyUser(context);

    return Scaffold(
      body: SafeArea(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: size.width * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://logosmarcas.net/wp-content/uploads/2020/09/Google-Logo.png"),
              ),
            ),
          ),
          SizedBox(
            height: size.width * 0.3,
          ),
          Container(
            child: Text(
              "Praticando autenticação \ncom o Google",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
