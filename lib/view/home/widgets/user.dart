import 'package:e_library/view_model/bloc_auth/auth_bloc.dart';
import 'package:e_library/view_model/bloc_auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

Widget userName(BuildContext context) {
  return BlocBuilder<AuthBloc, AuthState>(
    builder: (context, state) {
      if (state is LoadingState) {
        return const CircularProgressIndicator();
      }
      if (state is AuthenticatedState) {
        return Text(
          "Hello, ${state.user.email}",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        );
      } else {
        return Text(
          "Hello, User !",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        );
      }
    },
  );
}
