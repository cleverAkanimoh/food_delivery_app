import 'package:flutter/material.dart';

import '../constants.dart';
import '../services/auth/auth_service.dart';
import '../widgets/back_button.dart';
import '../widgets/settings_page/logout_widget.dart';
import '../widgets/settings_page/settings_container.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final user = AuthService().getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text("Profile"),
        leading: const CustomBackButton(),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit_document,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: extraSmallWhiteSpace),
          SettingsContainer(
            heading: "User Id",
            child: Text(user!.uid),
          ),
          SettingsContainer(
            heading: "Username",
            child: Text(user!.displayName ?? "No username"),
          ),
          SettingsContainer(
            heading: "Username",
            child: Text(user!.displayName ?? "No username"),
          ),
          SettingsContainer(
            heading: "Username",
            child: Text(user!.displayName ?? "No username"),
          ),
          const SizedBox(height: smallWhiteSpace),
          const LogoutWidget(),
        ],
      ),
    );
  }
}
