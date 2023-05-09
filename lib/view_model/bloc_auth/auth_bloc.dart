import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library/model/user_model.dart';
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
          User? user = FirebaseAuth.instance.currentUser;
          var collection = FirebaseFirestore.instance.collection('elibrary');
          if (user != null) {
            var data =
                await collection.doc(user.uid).collection('userdata').get();

            if (data.docs.isNotEmpty) {
              List<UserData> userData = (data.docs)
                  .map(
                    (e) => UserData(
                      username: e['username'],
                      email: e['email'],
                    ),
                  )
                  .toList();
              emit(
                AuthenticatedState(user: user, userData: userData[0]),
              );
            }
          } else {
            emit(
              UnAuthenticatedState(),
            );
          }
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
        User? user = FirebaseAuth.instance.currentUser;
        var collection = FirebaseFirestore.instance.collection('elibrary');
        if (user != null) {
          UserData data =
              UserData(username: event.username, email: event.email);
          await collection
              .doc(user.uid)
              .collection("userdata")
              .doc(user.uid)
              .set(data.toFirestore())
              .then(
                (_) => emit(
                  AuthenticatedState(user: user, userData: data),
                ),
              )
              .catchError(
                (error) => emit(
                  ErrorState(message: error.toString()),
                ),
              );
        } else {
          emit(const ErrorState(message: "Empty User"));
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          emit(
            const ErrorState(message: "The password provided is too weak."),
          );
          emit(
            InitialState(),
          );
        } else if (e.code == 'email-already-in-use') {
          emit(
            const ErrorState(
                message: "The account already exists for that email."),
          );
          emit(
            InitialState(),
          );
        }
      } catch (e) {
        emit(
          ErrorState(
            message: e.toString(),
          ),
        );
        emit(
          InitialState(),
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
          var collection = FirebaseFirestore.instance.collection("elibrary");
          await collection
              .doc(credential.user!.uid)
              .collection("userdata")
              .doc(credential.user!.uid)
              .get()
              .then(
            (DocumentSnapshot querySnapshot) {
              if (querySnapshot.exists && querySnapshot.data() != null) {
                UserData userData = UserData.fromFirestore(
                    querySnapshot.data() as Map<String, dynamic>);

                emit(AuthenticatedState(
                    user: credential.user!, userData: userData));
              }
            },
            onError: (e) => emit(
              ErrorState(message: e.toString()),
            ),
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(
              const ErrorState(message: "No user found."),
            );
          } else if (e.code == 'wrong-password') {
            emit(
              const ErrorState(message: "Wrong password."),
            );
          }
        } catch (e) {
          emit(
            ErrorState(message: e.toString()),
          );
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
          emit(
            ErrorState(
              message: e.toString(),
            ),
          );
          emit(
            InitialState(),
          );
        }
      },
    );
  }
}
