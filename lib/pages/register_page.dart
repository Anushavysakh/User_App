import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/pages/home_page.dart';
import 'package:login_page/authentication/auth_page.dart';
import 'package:login_page/widgets/widget.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  RegisterPage({required this.showLoginPage});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final background = "assets/register.png";
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();
  final TextEditingController _userName = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmpassword.dispose();
    _userName.dispose();
    super.dispose();
  }

  Future signUp() async {
    if (passwordConfirm()) {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _email.text.trim(), password: _password.text.trim());
      addUser(_userName.text.trim(), _email.text.trim());
    }
  }

  Future addUser(String userName, String email) async {
    await FirebaseFirestore.instance
        .collection('users')
        .add({'User Name': userName, 'Email': email});
  }

  bool passwordConfirm() {
    if (_password.text.trim() == _confirmpassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(background), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Create an Account',
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
                        child: Column(children: [
                          buildTextFieldUserName(_userName),
                          SizedBox(
                            height: 30,
                          ),
                          Form(
                            autovalidateMode: AutovalidateMode.always,
                            child: TextFormField(
                              validator: (value) =>
                                  EmailValidator.validate(value!)
                                      ? null
                                      : "invalid email",
                              autofocus: true,
                              style: TextStyle(color: Colors.black),
                              controller: _email,
                              decoration: buildInputDecoration('Email'),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          buildTextFieldPassword(_password),
                          SizedBox(
                            height: 20,
                          ),
                          buildTextFieldConfirmPassword(_confirmpassword),
                          Container(
                            height: 40,
                            width: 120,
                            child: ElevatedButton(
                                onPressed: () {
                                  signUp();
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => AuthPage(),));
                                },
                                child: Text("SignUp")),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Already a member ? ",
                                style: TextStyle(fontSize: 17),
                              ),
                              GestureDetector(
                                  onTap: widget.showLoginPage,
                                  child: Text(
                                    " SignIn",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ))
                            ],
                          ),
                        ]),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
