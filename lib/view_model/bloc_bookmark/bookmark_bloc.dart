import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_library/model/bookmark_model.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_event.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc() : super(InitialState()) {
    on<AddBookmark>(
      (event, emit) async {
        emit(LoadingState());

        try {
          User? user = FirebaseAuth.instance.currentUser;
          var collection = FirebaseFirestore.instance.collection('elibrary');
          if (user != null) {
            await collection
                .doc(user.uid)
                .collection("bookmarks")
                .doc(event.bookId)
                .set(event.bookData.toFirestore())
                .then(
                  (_) => emit(
                    const Bookmarked(message: "Bookmarked"),
                  ),
                )
                .catchError(
                  (error) => emit(
                    ErrorState(message: error.toString()),
                  ),
                );
          }
        } on Exception {
          (error) => emit(
                ErrorState(message: error.toString()),
              );
        }
      },
    );

    on<EditBookmark>(
      (event, emit) async {
        emit(LoadingState());

        try {
          User? user = FirebaseAuth.instance.currentUser;
          var collection = FirebaseFirestore.instance.collection('elibrary');
          if (user != null) {
            await collection
                .doc(user.uid)
                .collection("bookmarks")
                .doc(event.bookId)
                .update(event.bookData.toFirestore())
                .catchError(
                  (error) => emit(
                    ErrorState(message: error.toString()),
                  ),
                );
          }
        } on Exception {
          (error) => emit(
                ErrorState(message: error.toString()),
              );
        }
      },
    );

    on<DeleteBookmark>(
      (event, emit) async {
        emit(LoadingState());

        try {
          User? user = FirebaseAuth.instance.currentUser;
          var collection = FirebaseFirestore.instance.collection('elibrary');
          if (user != null) {
            await collection
                .doc(user.uid)
                .collection("bookmarks")
                .doc(event.bookId)
                .delete()
                .catchError(
                  (error) => emit(
                    ErrorState(message: error.toString()),
                  ),
                );
          }
        } on Exception {
          (error) => emit(
                ErrorState(message: error.toString()),
              );
        }
      },
    );

    on<FetchBookmarkedBooks>((event, emit) async {
      emit(LoadingState());

      try {
        User? user = FirebaseAuth.instance.currentUser;
        var collection = FirebaseFirestore.instance.collection('elibrary');
        if (user != null) {
          final querySnapshot =
              await collection.doc(user.uid).collection("bookmarks").get();

          if (querySnapshot.docs.isNotEmpty) {
            final List<DocumentSnapshot> documents = querySnapshot.docs;
            List<Bookmark> bookmarks = (documents)
                .map(
                  (e) => Bookmark(
                    bookId: e['book_id'],
                    bookImageUrl: e['book_image'],
                    bookTitle: e['book_title'],
                    bookUrl: e['book_url'],
                    lastRead: e['last_read'],
                    page: e['page'],
                    notes: e['notes'],
                    viewAbility: e['viewability'],
                    readingStatus: e['reading_status'],
                  ),
                )
                .toList();

            emit(
              SuccessState(data: bookmarks),
            );
          } else {
            const ErrorState(message: "No Data");
          }
        }
      } on Exception catch (e) {
        ErrorState(message: e.toString());
      }
    });

    on<FetchBookmarkedBookById>((event, emit) async {
      emit(LoadingState());

      try {
        User? user = FirebaseAuth.instance.currentUser;
        var collection = FirebaseFirestore.instance.collection('elibrary');
        if (user != null) {
          final querySnapshot = await collection
              .doc(user.uid)
              .collection("bookmarks")
              .doc(event.bookId)
              .get();

          if (querySnapshot.data() != null) {
            final documents = querySnapshot.data();
            Bookmark data = Bookmark.fromFirestore(documents!);
            List<Bookmark> bookData = [data];
            emit(
              SuccessState(data: bookData),
            );
          } else {
            const ErrorState(message: "No Data");
          }
        }
      } on Exception catch (e) {
        ErrorState(message: e.toString());
      }
    });

    on<FetchBookBookmarkStatus>((event, emit) async {
      emit(LoadingState());

      try {
        User? user = FirebaseAuth.instance.currentUser;
        var collection = FirebaseFirestore.instance.collection('elibrary');
        if (user != null) {
          await collection
              .doc(user.uid)
              .collection("bookmarks")
              .doc(event.bookId)
              .get()
              .then(
            (DocumentSnapshot querySnapshot) {
              if (querySnapshot.exists && querySnapshot.data() != null) {
                emit(const Bookmarked(message: "Added to Bookmark"));
              } else {
                emit(const NotBookmarked(message: "Removed from Bookmark"));
              }
            },
            onError: (e) => emit(
              ErrorState(message: e.toString()),
            ),
          );
        }
      } on Exception catch (e) {
        ErrorState(message: e.toString());
      }
    });
  }
}
