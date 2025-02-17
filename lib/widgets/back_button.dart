import "package:flutter/material.dart";

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context),
      tooltip: "back",
      icon: const Icon(
        Icons.arrow_back_ios_new_rounded,
      ),
    );
  }
}
