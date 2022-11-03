import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:login_page/widgets/widget.dart';

import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const LoginPage({super.key, required this.showRegisterPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final background = "assets/background.jpg";
  final googleSignIn = "assets/img.png";

  Future signIn() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(background), fit: BoxFit.cover),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 35, top: 130),
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 40),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 250),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        buildTextFieldEmail(_email),
                        SizedBox(
                          height: 30,
                        ),
                        buildTextFieldPassword(_password),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return ForgotPassword();
                                }));
                              },
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xff4c505b),
                                  fontSize: 18,
                                ),
                              )),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              signIn();
                            },
                            child: Text("Login")),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Not registered?",
                              style: TextStyle(fontSize: 17),
                            ),
                            GestureDetector(
                                onTap: widget.showRegisterPage,
                                child: Text(
                                  " SignUp",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
