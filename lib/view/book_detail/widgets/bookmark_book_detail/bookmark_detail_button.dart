import 'package:e_library/model/bookmark_model.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_bloc.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../model/book_webpage_model.dart';
import '../../../../view_model/bloc_bookmark/bookmark_event.dart';

Widget bookmarkDetailButton() {
  return BlocConsumer<BookmarkBloc, BookmarkState>(
    listener: (context, state) {
      if (state is ErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.message),
          ),
        );
      }
    },
    builder: (context, state) {
      if (state is LoadingState) {
        return Container(
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (state is SuccessState) {
        final Bookmark bookData = state.data[0];
        if (bookData.viewAbility == "ALL_PAGES") {
          return Container(
            padding: const EdgeInsets.only(top: 6),
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xff3879E9),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                context.read<BookmarkBloc>().add(
                      EditBookmark(
                        bookData.bookId,
                        Bookmark(
                            bookId: bookData.bookId,
                            bookImageUrl: bookData.bookImageUrl,
                            bookTitle: bookData.bookTitle,
                            authors: bookData.authors,
                            lastRead: DateFormat('MMM dd, yyyy')
                                .format(DateTime.now().toLocal())
                                .toString(),
                            page: bookData.page,
                            readingStatus: bookData.readingStatus,
                            bookUrl: bookData.bookUrl,
                            saleAbility: bookData.saleAbility,
                            notes: bookData.notes,
                            viewAbility: bookData.viewAbility),
                      ),
                    );

                Navigator.pushReplacementNamed(
                  context,
                  'bookmarkwebview',
                  arguments: WebBookData(
                    bookId: bookData.bookId,
                    bookTitle: bookData.bookTitle,
                    viewAbility: bookData.viewAbility,
                    saleAbility: bookData.saleAbility,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Continue Read Book",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        }
        if (bookData.viewAbility == "PARTIAL") {
          return Container(
            padding: const EdgeInsets.only(top: 6),
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xff3879E9),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                context.read<BookmarkBloc>().add(
                      EditBookmark(
                        bookData.bookId,
                        Bookmark(
                            authors: bookData.authors,
                            bookId: bookData.bookId,
                            bookImageUrl: bookData.bookImageUrl,
                            bookTitle: bookData.bookTitle,
                            lastRead: DateFormat('MMM dd, yyyy')
                                .format(DateTime.now().toLocal())
                                .toString(),
                            page: bookData.page,
                            readingStatus: bookData.readingStatus,
                            bookUrl: bookData.bookUrl,
                            saleAbility: bookData.saleAbility,
                            notes: bookData.notes,
                            viewAbility: bookData.viewAbility),
                      ),
                    );

                Navigator.pushReplacementNamed(
                  context,
                  'bookmarkwebview',
                  arguments: WebBookData(
                    bookId: bookData.bookId,
                    bookTitle: bookData.bookTitle,
                    viewAbility: bookData.viewAbility,
                    saleAbility: bookData.saleAbility,
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Continue Read Sample",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container(
            padding: const EdgeInsets.only(top: 6),
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(255, 152, 192, 255),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "No Preview Available",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        }
      }
      return const SizedBox();
    },
  );
}
