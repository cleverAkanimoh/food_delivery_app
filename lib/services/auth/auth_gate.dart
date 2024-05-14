import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/layout.dart';
// import '/pages/welcome_page.dart';
import 'login_or_register.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const Layout();
          }

          // user is a first timer
          // if (_box.get("first_timer") == null) {
          //   _box.put("first_timer", "false");
          //   return const WelcomePage();
          // }

          // user is NOT logged in
          else {
            return const AuthPage();
          }
        },
      ),
    );
  }
}
