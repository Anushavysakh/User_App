import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_page/authentication/auth_page.dart';

import '../pages/home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("Inside Home page ");
            return HomePage();
          } else {
            print("Inside login page");
            return AuthPage();
          }
        },
      ),
    );
  }
}
