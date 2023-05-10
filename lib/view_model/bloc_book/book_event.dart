import 'package:equatable/equatable.dart';

abstract class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object> get props => [];
}

class FetchBooks extends BookEvent {}

class FetchNextBooks extends BookEvent {
  final int index;

  const FetchNextBooks(this.index);
}
