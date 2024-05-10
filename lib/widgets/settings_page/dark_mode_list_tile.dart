import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class DarkModeListTile extends StatelessWidget {
  const DarkModeListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        "Dark Mode",
        style: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      trailing: CupertinoSwitch(
        value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
        onChanged: (value) =>
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
      ),
    );
  }
}
