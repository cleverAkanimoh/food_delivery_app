// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/pages/forgot_password_page.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';
import '../widgets/error_text.dart';
import '../widgets/my_alert_dialog.dart';
import '/widgets/auth/my_text_field.dart';
import '/widgets/my_button.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String errorMsg = "";
  bool isLoading = false;

  //  get instance of auth service
  final _authService = AuthService();

  void login() async {
    // show loading
    setState(() {
      isLoading = true;
    });
    // try sign in
    try {
      await _authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );

      setState(() {
        isLoading = false;
      });
    }
    // display any errors
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
          errorMsg = "Empty Field(s)";
        });
      } else {
        setState(() {
          errorMsg = err.replaceAll("-", " ").replaceAll("Exception: ", "");
        });
      }
      Timer(const Duration(seconds: 10), () {
        setState(() {
          errorMsg = "";
        });
      });
    }
  }

  void loginWithGoogle() async {
    // show loading
    setState(() {
      isLoading = true;
    });
    // try sign in
    try {
      await _authService.signInWithGoogleProvider();
    }
    // display any errors
    catch (e) {
      showDialog(
        context: context,
        builder: ((context) => MyAlertDialog(
              title: "An error occurred",
              content: Text(e.toString()),
            )),
      );

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraint) {
          return Center(
            child: SizedBox(
              width: constraint.maxWidth > mobileWidth ? 480 : null,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: largeWhiteSpace),
                    Icon(
                      Icons.lock_open_rounded,
                      size: largeWhiteSpace,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    const SizedBox(height: smallWhiteSpace),
                    Text(
                      "Quick Delivery App",
                      style: TextStyle(
                        fontSize: headingSize,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(height: whiteSpace),
                    TextButton(
                      onPressed: isLoading ? null : loginWithGoogle,
                      child: Text(
                        "Continue with google",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                    const SizedBox(height: whiteSpace),
                    // TextField
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

                    ErrorText(errorMsg: errorMsg),

                    const SizedBox(height: smallWhiteSpace),
                    MyButton(
                      onTap: login,
                      text: "Sign in",
                      isLoading: isLoading,
                    ),
                    const SizedBox(height: whiteSpace),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => const ForgotPasswordPage()),
                        ),
                      ),
                      child: Text(
                        "forgot password?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: whiteSpace),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Register now",
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: largeWhiteSpace),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
