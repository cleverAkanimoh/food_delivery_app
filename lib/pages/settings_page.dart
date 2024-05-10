import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/widgets/settings_page/logout_widget.dart';
import '/widgets/settings_page/dark_mode_list_tile.dart';
import '/widgets/settings_page/settings_header.dart';
import '/widgets/settings_page/settings_container.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SettingsHeader(),
        SettingsContainer(
          heading: "General",
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ))),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.groups_sharp,
                  ),
                  SizedBox(width: 15),
                  Text("Refer & Earn"),
                ],
              ),
            ),
          ),
        ),
        const SettingsContainer(
          heading: "Theme",
          child: DarkModeListTile(),
        ),
        const SizedBox(height: 20),
        const LogoutWidget(),
      ],
    );
  }
}
