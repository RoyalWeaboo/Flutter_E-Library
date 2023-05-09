// ignore_for_file: use_build_context_synchronously

import 'package:e_library/model/bookmark_model.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_bloc.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_event.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget bookmarkIcon(
    BuildContext context, bool showSnackbar, String bookId, Bookmark data) {
  return BlocConsumer<BookmarkBloc, BookmarkState>(
    listener: (context, state) {
      if (state is Bookmarked) {
        if (showSnackbar) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      }
      if (showSnackbar) {
        if (state is NotBookmarked) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      }
    },
    builder: (context, state) {
      if (state is LoadingState) {
        return const CircularProgressIndicator();
      }
      if (state is Bookmarked) {
        return InkWell(
          onTap: () async {
            showSnackbar = true;
            context.read<BookmarkBloc>().add(
                  DeleteBookmark(bookId),
                );
          },
          child: const Image(
            height: 32,
            fit: BoxFit.contain,
            image: AssetImage('assets/bookmarked.png'),
          ),
        );
      }
      if (state is NotBookmarked) {
        return InkWell(
          onTap: () async {
            showSnackbar = true;
            context.read<BookmarkBloc>().add(
                  AddBookmark(bookId, data),
                );
          },
          child: const Image(
            height: 32,
            fit: BoxFit.contain,
            image: AssetImage('assets/bookmark.png'),
          ),
        );
      }
      return InkWell(
        onTap: () async {
          context.read<BookmarkBloc>().add(
                AddBookmark(bookId, data),
              );
        },
        child: const Image(
          height: 32,
          fit: BoxFit.contain,
          image: AssetImage('assets/bookmark.png'),
        ),
      );
    },
  );
}
