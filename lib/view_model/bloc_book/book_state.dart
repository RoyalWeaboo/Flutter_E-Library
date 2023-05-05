import 'package:e_library/model/google_books_model.dart';
import 'package:equatable/equatable.dart';

abstract class BookState extends Equatable {
  const BookState();

  @override
  List<Object> get props => [];
}

class InitialState extends BookState {}

class LoadingState extends BookState {}

class SuccessState extends BookState {
  final GoogleBooks googleBooks;

  const SuccessState({required this.googleBooks});

  @override
  List<Object> get props => [googleBooks];
}

class ErrorState extends BookState {}
