// ignore_for_file: use_build_context_synchronously

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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // register function
  void register() async {
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
      }
      // display any error
      catch (e) {
        showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: Text(e.toString()),
              )),
        );
      }
    }

    // check if password != match -> show error
    else {
      showDialog(
        context: context,
        builder: ((context) => const AlertDialog(
              title: Text("Passwords don't match"),
            )),
      );
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
                child: ListView(
                  children: [
                    Column(
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
                          controller: emailController,
                          hintText: "Email",
                          obscureText: false,
                        ),
                        MyTextField(
                          controller: passwordController,
                          hintText: "Password",
                          obscureText: true,
                        ),
                        MyTextField(
                          controller: confirmPasswordController,
                          hintText: "Confirm Password",
                          obscureText: true,
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
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
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
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
