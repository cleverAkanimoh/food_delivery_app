import 'package:flutter/material.dart';

import '../constants.dart';

class MyAlertDialog extends StatelessWidget {
  final String? title;
  final Widget? content;
  final Color? primaryActionColor;
  final void Function()? onPressed;
  const MyAlertDialog({
    super.key,
    this.title,
    this.content,
    this.primaryActionColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      surfaceTintColor: Colors.transparent,
      title: Text(
        title!,
        style: TextStyle(
          fontSize: headingSize,
          fontWeight: FontWeight.bold,
          color: primaryActionColor,
        ),
      ),
      content: content,
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            "Continue",
            style: TextStyle(
              color: primaryActionColor,
            ),
          ),
        ),
      ],
    );
  }
}
