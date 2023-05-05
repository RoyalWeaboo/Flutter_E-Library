import 'package:e_library/model/google_books_model.dart';
import 'package:e_library/model/service/google_books_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_event.dart';
import 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  BookBloc() : super(InitialState()) {
    final GoogleBooksApi googleBooksApi = GoogleBooksApi();

    on<FetchBooks>(
      (event, emit) async {
        emit(LoadingState());

        final GoogleBooks response = await googleBooksApi.getBooks("Games");

        emit(
          SuccessState(googleBooks: response),
        );
      },
    );
  }
}
