import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_page/registratiob_page.dart';
import 'package:login_page/welcome_page.dart';
import 'package:login_page/widgets/widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _userName = TextEditingController();
  final background = "assets/background.jpg";
  final googleSignin = "assets/img.png";

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
                          TextField(
                            style: TextStyle(color: Colors.black),
                            controller: _email,
                            decoration: buildInputDecoration('Email'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: _password,
                            obscureText: true,
                            decoration: buildInputDecoration('Password'),
                          ),
                          Container(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: TextButton(
                                onPressed: () {},
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
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        WelcomePage(_userName)));
                              },
                              child: Text("Login")),
                          Text("-or-",style: TextStyle(fontSize: 17)),
                          ButtonBar(mainAxisSize: MainAxisSize.min,
                            children: [ElevatedButton(onPressed: () {  },
                            child: Image(image: AssetImage(googleSignin),height: 50,))],
                            
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Not registered ? ',
                              style: TextStyle(fontSize: 17),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' SignUp!',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      RegistrationPage();
                                    },
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
