// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '/services/auth/auth_service.dart';
import '/widgets/auth/my_text_field.dart';
import '/widgets/my_button.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String errorMsg = "";
  bool isLoading = false;

  // register function
  void register() async {
    // show loading
    setState(() {
      isLoading = true;
    });
    // get auth service
    final _authService = AuthService();

    // check if password match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      // try creating user
      try {
        await _authService.signUpWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );

        FirebaseFirestore.instance.collection('users').add({
          "email": emailController.text,
          "username": usernameController.text,
          "imageUrl": null,
          "address": null,
          "loyaltyPoint": 0,
          "coupons": [],
          "role": "user",
        });

        setState(() {
          isLoading = false;
        });
      }
      // display any error
      catch (e) {
        var err = e.toString();
        setState(() {
          isLoading = false;
        });
        if (err.contains("network-request-failed")) {
          setState(() {
            errorMsg = "Please check your network";
          });
        } else if (err.contains("channel-error")) {
          setState(() {
            errorMsg = "Invalid Credentials";
          });
        } else {
          setState(() {
            errorMsg = "An Unknown Error Occurred";
          });
        }
        Timer(
          const Duration(seconds: 5),
          () {
            setState(() {
              errorMsg = "";
            });
          },
        );

        setState(() {
          isLoading = false;
        });
      }
    }

    // check if password != match -> show error
    else {
      setState(() {
        errorMsg = "Passwords don't match";
      });
      Timer(const Duration(seconds: 10), () {
        setState(() {
          errorMsg = "";
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraint) {
            return Center(
              child: SizedBox(
                width: constraint.maxWidth > mobileWidth ? 480 : null,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: largeWhiteSpace),
                      Icon(
                        Icons.lock_open_rounded,
                        size: 100,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      const SizedBox(height: whiteSpace),
                      Text(
                        "Let's create an account for you",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      const SizedBox(height: whiteSpace),
                      // TextField

                      MyTextField(
                        controller: usernameController,
                        hintText: "Username",
                        obscureText: false,
                        icon: Icons.person,
                      ),
                      MyTextField(
                        controller: emailController,
                        hintText: "Email",
                        obscureText: false,
                        icon: Icons.alternate_email,
                      ),
                      MyTextField(
                        controller: passwordController,
                        hintText: "Password",
                        obscureText: true,
                        icon: Icons.key,
                      ),
                      MyTextField(
                        controller: confirmPasswordController,
                        hintText: "Confirm Password",
                        obscureText: true,
                        icon: Icons.key,
                      ),

                      AnimatedContainer(
                        duration: Durations.medium4,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                        ),
                        height: errorMsg == "" ? 0 : 40,
                        child: Row(
                          children: [
                            Text(
                              errorMsg,
                              style: const TextStyle(
                                color: Colors.redAccent,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: whiteSpace),

                      MyButton(
                        onTap: register,
                        text: "Register",
                      ),

                      const SizedBox(height: whiteSpace),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              "Log in here",
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: largeWhiteSpace),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
