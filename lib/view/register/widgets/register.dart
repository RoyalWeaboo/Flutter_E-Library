import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../view_model/bloc_auth/auth_bloc.dart';
import '../../../view_model/bloc_auth/auth_state.dart';

Widget registerState(BuildContext context) {
  return BlocListener<AuthBloc, AuthState>(
    listener: (context, state) {
      if (state is AuthenticatedState) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Success !"),
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
