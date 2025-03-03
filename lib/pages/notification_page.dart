import 'package:flutter/material.dart';

import '../widgets/back_button.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        backgroundColor: Colors.transparent,
        leading: const CustomBackButton(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
            ),
          )
        ],
      ),
      body: const Center(
        child: Text("You have no notification"),
      ),
    );
  }
}
