import 'package:e_library/model/google_books_model.dart';
import 'package:e_library/model/service/google_books_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'search_event.dart';
import 'search_state.dart';

class BookSearchBloc extends Bloc<BookSearchEvent, BookSearchState> {
  BookSearchBloc() : super(InitialState()) {
    final GoogleBooksApi googleBooksApi = GoogleBooksApi();

    on<SearchBooks>(
      (event, emit) async {
        emit(LoadingState());

        try {
          final GoogleBooks response = await googleBooksApi.getBooksBySubject(
              event.query, event.subject);

          emit(
            SuccessState(googleBooks: response),
          );
        } catch (e) {
          emit(
            ErrorState(),
          );
        }
      },
    );

    on<SearchNextBook>(
      (event, emit) async {
        emit(LoadingState());

        final GoogleBooks response = await googleBooksApi.getBooksBySubject(
          event.query,
          event.subject,
          startIndex: event.index,
        );

        emit(
          SuccessState(googleBooks: response),
        );
      },
    );
  }
}
