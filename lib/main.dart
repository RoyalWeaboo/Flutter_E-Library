import 'package:e_library/view/book_detail/screen/book_detail_screen.dart';
import 'package:e_library/view/book_detail/screen/bookmark_detail_screen.dart';
import 'package:e_library/view/bookmark/screen/bookmark_screen.dart';
import 'package:e_library/view/bookmark/screen/update_bookmark_screen.dart';
import 'package:e_library/view/home/screen/home_screen.dart';
import 'package:e_library/view/login/screen/login_screen.dart';
import 'package:e_library/view/profile/screen/profile_screen.dart';
import 'package:e_library/view/register/screen/register_screen.dart';
import 'package:e_library/view/search/screen/search_screen.dart';
import 'package:e_library/view/splash_screen/screen/splash_screen.dart';
import 'package:e_library/view/webview/screen/book_webview.dart';
import 'package:e_library/view/webview/screen/bookmark_webview.dart';
import 'package:e_library/view_model/bloc_auth/auth_bloc.dart';
import 'package:e_library/view_model/bloc_book/book_bloc.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_bloc.dart';
import 'package:e_library/view_model/bloc_search/search_bloc.dart';
import 'package:e_library/view_model/password_visibility_provider.dart';
import 'package:e_library/view_model/radio_button_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'model/firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RadioButtonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PasswordButtonProvider(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              return AuthBloc();
            },
          ),
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
          BlocProvider(
            create: (context) {
              return BookmarkBloc();
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
          initialRoute: '/',
          routes: {
            '/': (_) => const SplashScreen(),
            'login': (_) => const LoginScreen(),
            'register': (_) => const RegisterScreen(),
            'home': (_) => const HomeScreen(),
            'search': (_) => const SearchScreen(),
            'bookdetail': (_) => const BookDetailScreen(),
            'bookmarkdetail': (_) => const BookmarkBookDetailScreen(),
            'updatebookmark': (_) => const UpdateBookmarkScreen(),
            'bookmark': (_) => const BookmarkScreen(),
            'profile': (_) => const ProfileScreen(),
            'webview': (_) => const BookWebPageScreen(),
            'bookmarkwebview': (_) => const BookmarkWebPageScreen(),
          },
        ),
      ),
    );
  }
}
