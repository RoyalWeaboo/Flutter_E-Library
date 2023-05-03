import 'package:e_library/view/screens/book_detail_screen.dart';
import 'package:e_library/view/screens/bookmark_screen.dart';
import 'package:e_library/view/screens/home_screen.dart';
import 'package:e_library/view/screens/login_screen.dart';
import 'package:e_library/view/screens/profile_screen.dart';
import 'package:e_library/view/screens/register_screen.dart';
import 'package:e_library/view/screens/search_screen.dart';
import 'package:e_library/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
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
      initialRoute: 'home',
      routes: {
        '/': (_) => const SplashScreen(),
        'login': (_) => const LoginScreen(),
        'register': (_) => const RegisterScreen(),
        'home': (_) => const HomeScreen(),
        'search': (_) => const SearchScreen(),
        'bookdetail': (_) => const BookDetailScreen(),
        'bookmark': (_) => const BookmarkScreen(),
        'profile': (_) => const ProfileScreen(),
      },
    );
  }
}
