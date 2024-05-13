import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/firebase_options.dart';
import '/services/auth/auth_gate.dart';
import '/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter();
  // open hive box
  var box = await Hive.openBox("box");
  runApp(
    MultiProvider(
      providers: [
        // theme provider
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        // restaurant provider
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
      home: const AuthGate(),
    );
  }
}
