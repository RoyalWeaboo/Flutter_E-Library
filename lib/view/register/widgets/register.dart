import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../view_model/bloc_auth/auth_bloc.dart';
import '../../../view_model/bloc_auth/auth_state.dart';

class RegisterState extends StatelessWidget {
  const RegisterState({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                "Registration Success ! Welcome ${state.userData.username}.",
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          );
          Navigator.of(context).pushReplacementNamed('home');
        }
        if (state is UnAuthenticatedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Failed ! Please try again later"),
            ),
          );
        }
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Container(
              color: Colors.white,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (state is InitialState) {
            return Container(
              color: Colors.white,
            );
          }
          return Container(
            color: Colors.white,
          );
        },
      ),
    );
  }
}
