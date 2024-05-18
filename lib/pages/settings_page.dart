import 'package:flutter/material.dart';

import '../widgets/back_button.dart';
import '../widgets/settings_page/dark_mode_list_tile.dart';
import '../widgets/settings_page/settings_container.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
        leading: const CustomBackButton(),
      ),
      body: const Column(
        children: [
          SizedBox(height: 10),
          SettingsContainer(
            heading: "Theme",
            child: DarkModeListTile(),
          ),
        ],
      ),
    );
  }
}
