import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/controllers/authController.dart';
import 'package:project/models/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final authController = AuthController();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: size.width * 0.5,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: size.width * 0.04),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Olá, " + widget.user.name + "\n",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Você está logado(a) \n no email:  ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          widget.user.email,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: size.width * 0.1),
                    height: size.width * 0.2,
                    width: size.width * 0.2,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(widget.user.photoURL),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: size.width * 0.2),
              child: Text(
                "Você possui uma conta logada ao aplicativo \n\nPara fazer logout clique no botão abaixo",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            GestureDetector(
              onTap: () {
                authController.logoutUser(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: size.width * 0.7),
                width: size.width * 0.8,
                padding: EdgeInsets.all(size.width * 0.02),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image(
                      width: size.width * 0.1,
                      image: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2048px-Google_%22G%22_Logo.svg.png"),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: size.width * 0.02, right: size.width * 0.15),
                      color: Colors.black,
                      width: 1,
                      height: size.width * 0.1,
                    ),
                    Container(
                      child: Text(
                        "Fazer Logout",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.05,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
