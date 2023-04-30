import 'package:e_library/view/login_screen.dart';
import 'package:e_library/view/register_screen.dart';
import 'package:e_library/view/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Library',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
      home: const RegisterScreen(),
    );
  }
}
