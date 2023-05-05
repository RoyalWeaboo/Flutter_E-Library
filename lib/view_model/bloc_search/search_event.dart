import 'package:equatable/equatable.dart';

abstract class BookSearchEvent extends Equatable {
  const BookSearchEvent();

  @override
  List<Object> get props => [];
}

class SearchBooks extends BookSearchEvent {
  final String query;
  final String subject;

  const SearchBooks(this.query, this.subject);
}
