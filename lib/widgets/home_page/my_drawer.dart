import 'package:flutter/material.dart';
import '/widgets/home_page/my_drawer_tile.dart';

import '../../pages/settings_page.dart';
import '../../services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    //  get instance of auth service
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          const Spacer(),
          MyDrawerTile(
            text: "L O G O U T ",
            icon: Icons.power_settings_new,
            onTap: logout,
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
