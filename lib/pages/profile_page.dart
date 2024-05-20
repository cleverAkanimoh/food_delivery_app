import 'package:flutter/material.dart';
import '/widgets/my_alert_dialog.dart';
import '/widgets/settings_page/settings_header.dart';

import '/constants.dart';
import '/services/auth/auth_service.dart';
import '/widgets/back_button.dart';
import '/widgets/settings_page/logout_widget.dart';
import '/widgets/settings_page/settings_container.dart';
import '/widgets/title_text.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final user = AuthService().getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const TitleText(
          text: "Clever Akanimoh",
        ),
        leading: const CustomBackButton(),
        actions: [
          IconButton(
            onPressed: () {},
            tooltip: "Edit Profile",
            icon: Icon(
              Icons.edit_document,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SettingsHeader(
              hasSettings: false,
            ),
            const SizedBox(height: whiteSpace),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: whiteSpace,
                vertical: smallWhiteSpace,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleText(text: "First name"),
                  SizedBox(width: smallWhiteSpace),
                  TitleText(text: "Last name"),
                ],
              ),
            ),
            SettingsContainer(
              heading: "User Id",
              child: Text(user!.uid),
            ),
            SettingsContainer(
              heading: "Email",
              child: Text(user!.email!),
            ),
            SettingsContainer(
              heading: "Latest order",
              child: Text(user!.email!),
            ),
            SettingsContainer(
              heading: "Date joined",
              child: Text(
                user!.metadata.creationTime.toString().replaceAll("7Z", ""),
              ),
            ),
            const SizedBox(height: smallWhiteSpace),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: ((context) => MyAlertDialog(
                          title: "Delete Account",
                          content: const Text(
                              "Are you sure you want to delete your account?"),
                          primaryActionColor: Colors.red,
                          onPressed: () {},
                        )),
                  ),
                  child: const Text(
                    "Delete Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                const SizedBox(width: smallWhiteSpace),
                const LogoutWidget(),
              ],
            ),
            const SizedBox(height: whiteSpace),
          ],
        ),
      ),
    );
  }
}
