import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/settings_page/logout_widget.dart';
import '../widgets/settings_page/settings_container.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: const Column(
        children: [
          SizedBox(height: 10),
          SettingsContainer(
            heading: "User",
            child: Text("user name"),
          ),
          SizedBox(height: whiteSpace),
          LogoutWidget(),
        ],
      ),
    );
  }
}
