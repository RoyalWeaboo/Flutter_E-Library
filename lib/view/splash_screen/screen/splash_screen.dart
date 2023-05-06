import 'package:e_library/view_model/bloc_auth/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/bloc_auth/auth_bloc.dart';
import '../../../view_model/bloc_auth/auth_state.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      context.read<AuthBloc>().add(
            GetSession(),
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            Navigator.of(context).pushReplacementNamed('home');
          }
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is InitialState) {
            return SizedBox(
              width: width,
              height: height * 0.8,
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.2),
                child: const Image(
                  image: AssetImage("assets/splash_screen_icon.png"),
                ),
              ),
            );
          }
          return Container(
            height: height,
            width: width,
            color: Colors.white,
            child: const Center(
              child: Text("Something is Wrong"),
            ),
          );
        },
      ),
    );
  }
}
