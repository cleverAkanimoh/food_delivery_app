import 'package:flutter/material.dart';

import '../constants.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({
    super.key,
    required this.errorMsg,
  });

  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Durations.medium4,
      padding: const EdgeInsets.symmetric(
        horizontal: whiteSpace,
      ),
      margin: const EdgeInsets.only(left: smallWhiteSpace),
      height: errorMsg == "" ? 0 : 40,
      child: Row(
        children: [
          Text(
            errorMsg.replaceAll("-", " ").replaceAll("Exception: ", ""),
            style: const TextStyle(
              color: Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }
}
