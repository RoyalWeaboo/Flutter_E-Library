import 'package:e_library/model/google_books_model.dart';
import 'package:equatable/equatable.dart';

abstract class BookSearchState extends Equatable {
  const BookSearchState();

  @override
  List<Object> get props => [];
}

class InitialState extends BookSearchState {}

class LoadingState extends BookSearchState {}

class SuccessState extends BookSearchState {
  final GoogleBooks googleBooks;

  const SuccessState({required this.googleBooks});

  @override
  List<Object> get props => [googleBooks];
}

class ErrorState extends BookSearchState {}
