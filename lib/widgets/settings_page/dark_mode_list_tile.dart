import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class DarkModeListTile extends StatefulWidget {
  const DarkModeListTile({
    super.key,
  });

  @override
  State<DarkModeListTile> createState() => _DarkModeListTileState();
}

class _DarkModeListTileState extends State<DarkModeListTile> {
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
