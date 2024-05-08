import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'auth/login_or_register.dart';
import 'themes/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // restuarant provider
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const AppEntryPoint(),
    ),
  );
}

class AppEntryPoint extends StatelessWidget {
  const AppEntryPoint({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Delivery App',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const AuthPage(),
    );
  }
}
