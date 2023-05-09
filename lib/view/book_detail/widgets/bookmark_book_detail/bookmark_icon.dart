// ignore_for_file: use_build_context_synchronously

import 'package:e_library/view_model/bloc_bookmark/bookmark_bloc.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget bookmarkDetailIcon(BuildContext context, String bookId) {
  return InkWell(
    onTap: () async {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Remove from Bookmark ?"),
              content: const Text(
                  "Bookmark data such as page and notes for this book will be lost"),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    context.read<BookmarkBloc>().add(
                          DeleteBookmark(bookId),
                        );

                    Navigator.pushReplacementNamed(context, 'bookmark');
                  },
                  child: const Text('Remove'),
                ),
              ],
            );
          });
    },
    child: const Image(
      height: 32,
      fit: BoxFit.contain,
      image: AssetImage('assets/bookmarked.png'),
    ),
  );
}
