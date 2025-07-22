import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AIApp());
}

class AIApp extends StatelessWidget {
  const AIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
      fontFamily: 'Satoshi',
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        fontFamily: 'Satoshi',
        brightness: Brightness.dark,
      ),

      home: const HomeScreen(),
    );
  }
}