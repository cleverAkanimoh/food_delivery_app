import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/layout.dart';
import 'package:food_delivery_app/pages/welcome_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'login_or_register.dart';

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  // reference hive box for local storage
  final _box = Hive.box("box");

  bool checkBoxForFirstTimer() {
    if (_box.get("first_timer")) {
      return true;
    } else {
      _box.put("first_timer", true);
      return false;
    }
  }

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

          // user is NOT logged in
          else {
            return checkBoxForFirstTimer()
                ? const AuthPage()
                : const WelcomePage();
          }
        },
      ),
    );
  }
}
