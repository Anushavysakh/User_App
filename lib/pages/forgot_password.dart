
import 'package:flutter/material.dart';

import '../widgets/widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade200,
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Enter email for password recovery ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 30, right: 30),
            child: TextField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              controller: _email,
              decoration: buildInputDecoration('Email'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          MaterialButton(
              onPressed: () {},
              child: Text("Reset Password"),
              color: Colors.blue)
        ],
      ),
    );
  }
}