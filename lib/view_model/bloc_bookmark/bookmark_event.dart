import 'package:e_library/model/bookmark_model.dart';
import 'package:equatable/equatable.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => [];
}

class AddBookmark extends BookmarkEvent {
  final String bookId;
  final Bookmark bookData;

  const AddBookmark(this.bookId, this.bookData);
}

class EditBookmark extends BookmarkEvent {
  final String bookId;
  final Bookmark bookData;

  const EditBookmark(this.bookId, this.bookData);
}

class DeleteBookmark extends BookmarkEvent {
  final String bookId;

  const DeleteBookmark(this.bookId);
}

class FetchBookmarkedBooks extends BookmarkEvent {}

class FetchBookmarkedBookById extends BookmarkEvent {
  final String bookId;

  const FetchBookmarkedBookById(this.bookId);
}

class FetchBookBookmarkStatus extends BookmarkEvent {
  final String bookId;

  const FetchBookBookmarkStatus(this.bookId);
}
