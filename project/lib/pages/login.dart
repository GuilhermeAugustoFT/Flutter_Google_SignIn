import 'package:flutter/material.dart';
import 'package:project/controllers/authController.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final authController = AuthController();
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            height: size.width * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://logosmarcas.net/wp-content/uploads/2020/09/Google-Logo.png"),
              ),
            ),
          ),
          Container(
            child: Text(
              "Você não possui conta vinculada \nao aplicativo \n\n\n\nClique no botão abaixo para vincular com sua conta Google",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          GestureDetector(
            onTap: () {
              authController.googleSignIn(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: size.width * 0.7),
              width: size.width * 0.8,
              padding: EdgeInsets.all(size.width * 0.02),
              decoration: BoxDecoration(
                color: Color(0xFFCCCFCD),
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
                        left: size.width * 0.02, right: size.width * 0.08),
                    color: Colors.black,
                    width: 1,
                    height: size.width * 0.1,
                  ),
                  Container(
                    child: Text(
                      "Entre com uma conta Google",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: size.width * 0.038,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
