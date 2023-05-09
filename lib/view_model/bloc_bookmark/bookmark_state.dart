import 'package:e_library/model/bookmark_model.dart';
import 'package:equatable/equatable.dart';

abstract class BookmarkState extends Equatable {
  const BookmarkState();

  @override
  List<Object> get props => [];
}

class InitialState extends BookmarkState {}

class LoadingState extends BookmarkState {}

class SuccessState extends BookmarkState {
  final List<Bookmark> data;

  const SuccessState({required this.data});

  @override
  List<Object> get props => [data];
}

class Bookmarked extends BookmarkState {
  final String message;

  const Bookmarked({required this.message});

  @override
  List<Object> get props => [message];
}

class NotBookmarked extends BookmarkState {
  final String message;

  const NotBookmarked({required this.message});

  @override
  List<Object> get props => [message];
}

class ErrorState extends BookmarkState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
