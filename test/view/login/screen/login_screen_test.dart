import 'package:e_library/view/login/screen/login_screen.dart';
import 'package:e_library/view_model/bloc_auth/auth_bloc.dart';
import 'package:e_library/view_model/password_visibility_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets(
    'UI Testing on Login Screen',
    (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
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
            ],
            child: const MaterialApp(
              home: LoginScreen(),
            ),
          ),
        ),
      );

      expect(find.text("Login"), findsWidgets);
      expect(find.text("Please enter your email and password"), findsWidgets);

      expect(find.widgetWithText(TextFormField, "Email"), findsWidgets);
      expect(find.widgetWithText(TextFormField, "Password"), findsWidgets);
      expect(find.widgetWithText(ElevatedButton, "Login"), findsWidgets);
      expect(find.text("Don't have an account ?"), findsWidgets);
      expect(find.text(" Register"), findsWidgets);
    },
  );
}
