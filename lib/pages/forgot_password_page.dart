import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';
import 'package:food_delivery_app/widgets/back_button.dart';

import '../constants.dart';
import '../widgets/auth/my_text_field.dart';
import '../widgets/error_text.dart';
import '../widgets/my_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();

  String errorMsg = "";
  bool isLoading = false;

  final _authService = AuthService();

  void forgotPw() {
    setState(() {
      isLoading = true;
    });
    try {
      _authService.forgotPassword(emailController.text);
    } catch (error) {
      setState(() {
        errorMsg = error.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Forgot Password"),
        leading: const CustomBackButton(),
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
                      size: extraLargeWhiteSpace,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    const SizedBox(height: smallWhiteSpace),
                    Text(
                      brandName,
                      style: TextStyle(
                        fontSize: headingSize,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    const SizedBox(height: whiteSpace),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: whiteSpace),
                      child: Text(
                        "Enter your email and we will send you a reset link",
                        style: TextStyle(
                          fontSize: smallSize,
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

                    ErrorText(errorMsg: errorMsg),

                    const SizedBox(height: smallWhiteSpace),
                    MyButton(
                      onTap: forgotPw,
                      text: "Reset Password",
                      isLoading: isLoading,
                    ),
                    // const SizedBox(height: whiteSpace),
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
