import 'package:flutter/material.dart';
import '/layout.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Layout(),
        ),
      ),
      child: const Text("Go back to home"),
    );
  }
}
