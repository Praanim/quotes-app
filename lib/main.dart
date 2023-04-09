import 'package:flutter/material.dart';
import 'package:qoute_app/core/theme/pallete.dart';
import 'package:qoute_app/features/auth/presentation/screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quotes App',
      theme: CustomAppTheme().customLightTheme,
      home: const LoginScreen(),
    );
  }
}
