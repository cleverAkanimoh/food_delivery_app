import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../services/auth/auth_service.dart';
import '../widgets/settings_page/dark_mode_list_tile.dart';
import '/widgets/settings_page/settings_container.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void logout() {
    //  get instance of auth service
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const SettingsContainer(
            child: DarkModeListTile(),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: logout,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "logout",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const Icon(
                  Icons.power_settings_new,
                  size: 28,
                  color: Colors.redAccent,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
