import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc()
      : super(
          InitialState(),
        ) {
    on<GetSession>(
      (event, emit) async {
        emit(
          LoadingState(),
        );

        try {
          FirebaseAuth.instance.authStateChanges().listen(
            (User? user) {
              if (user != null) {
                emit(
                  AuthenticatedState(user: user),
                );
              } else {
                emit(
                  InitialState(),
                );
              }
            },
          );
        } on Exception catch (e) {
          emit(
            ErrorState(
              message: e.toString(),
            ),
          );
        }
      },
    );

    on<Register>((event, emit) async {
      emit(
        LoadingState(),
      );

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(
          InitialState(),
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(
            const ErrorState(message: "The password provided is too weak."),
          );
        } else if (e.code == 'email-already-in-use') {
          emit(
            const ErrorState(
                message: "The account already exists for that email."),
          );
        }
      } catch (e) {
        emit(
          ErrorState(
            message: e.toString(),
          ),
        );
      }
    });

    on<Login>(
      (event, emit) async {
        emit(
          LoadingState(),
        );

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
          emit(
            AuthenticatedState(user: credential.user!),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(
              const ErrorState(message: "No user found for that email."),
            );
          } else if (e.code == 'wrong-password') {
            emit(
              const ErrorState(message: "Wrong password."),
            );
          }
        } catch (e) {
          print(e.toString());
        }
      },
    );

    on<Logout>(
      (event, emit) async {
        emit(
          LoadingState(),
        );

        try {
          await FirebaseAuth.instance.signOut();
          emit(
            InitialState(),
          );
        } catch (e) {
          print(e.toString());
          emit(
            ErrorState(
              message: e.toString(),
            ),
          );
        }
      },
    );
  }
}
