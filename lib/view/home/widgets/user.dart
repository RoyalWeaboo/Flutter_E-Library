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
        return RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 14.0,
            ),
            children: <TextSpan>[
              TextSpan(
                text: "Hello, ",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: state.userData.username,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: const Color(0xff3879E9),
                ),
              ),
            ],
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
// Future<String> getUser() async {
//   final prefs = await SharedPreferences.getInstance();
//   final nama = prefs.getString('userId') ?? "gakada";
//   return nama;
// }

// Widget userName(BuildContext context) {
//   String nama = ge
//   return Text(
//     "Hello, $nama",
//     style: GoogleFonts.inter(
//       fontWeight: FontWeight.w600,
//       fontSize: 18,
//       color: const Color.fromARGB(255, 0, 0, 0),
//     ),
//   );
// }
