import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/auth/my_text_field.dart';
import '../widgets/my_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  String errorMsg = "";

  void forgotPw() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Forgot Password"),
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraint) {
          return Center(
            child: SizedBox(
              width: constraint.maxWidth > mobileWidth ? 480 : null,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Icon(
                      Icons.lock_open_rounded,
                      size: 100,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    const SizedBox(height: whiteSpace),
                    Text(
                      "Quick Delivery App",
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(height: whiteSpace),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        "Enter your email and we will send you a reset link",
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.primary,
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
                    MyButton(onTap: forgotPw, text: "Reset Password"),
                    const SizedBox(height: whiteSpace),
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
