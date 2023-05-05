import 'package:e_library/view/book_detail/screen/book_detail_screen.dart';
import 'package:e_library/view/bookmark/screen/bookmark_screen.dart';
import 'package:e_library/view/home/screen/home_screen.dart';
import 'package:e_library/view/login/screen/login_screen.dart';
import 'package:e_library/view/profile/screen/profile_screen.dart';
import 'package:e_library/view/register/screen/register_screen.dart';
import 'package:e_library/view/search/screen/search_screen.dart';
import 'package:e_library/view/splash_screen/screen/splash_screen.dart';
import 'package:e_library/view_model/bloc_book/book_bloc.dart';
import 'package:e_library/view_model/bloc_search/search_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/firebase/firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return BookBloc();
          },
        ),
        BlocProvider(
          create: (context) {
            return BookSearchBloc();
          },
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
