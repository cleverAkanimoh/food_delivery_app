// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';
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

  void login() async {
    //  get instance of auth service
    final _authService = AuthService();

    // try sign in
    try {
      await _authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
    }
    // display any errors
    catch (e) {
      showDialog(
        context: context,
        builder: ((context) => AlertDialog(
              title: Text(e.toString()),
            )),
      );
    }

    // await any errors
  }

  void forgotPw() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.lock_open_rounded,
                        size: 100,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      const SizedBox(height: 25),
                      Text(
                        "Quick Delivery App",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                      const SizedBox(height: 25),
                      // TextField
                      MyTextField(
                        controller: emailController,
                        hintText: "Email",
                        obscureText: false,
                      ),
                      MyTextField(
                        controller: passwordController,
                        hintText: "Password",
                        obscureText: true,
                      ),

                      const SizedBox(height: 20),
                      MyButton(onTap: login, text: "Log in"),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account? ",
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              "Register now",
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

                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        child: const Text("or"),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Continue with google",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
