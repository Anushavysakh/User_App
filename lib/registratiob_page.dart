import 'package:flutter/material.dart';
import 'package:login_page/welcome_page.dart';
import 'package:login_page/widgets/widget.dart';

class RegistrationPage extends StatelessWidget {
  RegistrationPage({Key? key}) : super(key: key);
  final background = "assets/register.png";
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List images = [
      "assets/google.png",
      "assets/facebook.png",
      "assets/twitter.png"
    ];
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
                              decoration: buildInputDecoration('Password')),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                              controller: _password,
                              obscureText: true,
                              decoration:
                              buildInputDecoration('Re-enter Password')),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 40,
                            width: 120,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => WelcomePage(_userName)));
                                },
                                child: Text("SignUp")),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text("-OR-"),SizedBox(
                            height: 20,
                          ),
                          Text("SignUp with "),
                          SizedBox(
                            height: 10,
                          ),
                          Wrap(
                              children: List<Widget>.generate(
                                images.length,
                                    (index) {
                                  return Padding(
                                    padding: EdgeInsets.all(10),
                                    child: CircleAvatar(
                                        backgroundColor: Colors.grey[500],
                                        radius: 30,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 25,
                                          backgroundImage: AssetImage(images[index]),
                                        )),
                                  );
                                },
                              ))
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
