import 'package:e_library/model/google_books_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../view_model/bloc_book/book_bloc.dart';
import '../../../../view_model/bloc_book/book_state.dart';

Widget bookDetailCard(VolumeInfo volumeInfo) {
  return BlocBuilder<BookBloc, BookState>(
    builder: (context, state) {
      if (state is LoadingState) {
        return const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (state is SuccessState) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
          color: const Color(0xffF7F9FB),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    bookPage(volumeInfo),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Pages",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff0C0D36),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    bookLanguage(volumeInfo),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Language",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff0C0D36),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    bookPublishedDate(volumeInfo),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Publish Date",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff0C0D36),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
      if (state is ErrorState) {
        return const Text("Something is wrong, try again later");
      }
      return const Text("");
    },
  );
}

Widget bookPage(VolumeInfo volumeInfo) {
  if (volumeInfo.pageCount != null) {
    return Text(
      volumeInfo.pageCount.toString(),
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        color: const Color(0xff0C0D36),
      ),
    );
  } else {
    return Text(
      "-",
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        color: const Color(0xff0C0D36),
      ),
    );
  }
}

Widget bookLanguage(VolumeInfo volumeInfo) {
  if (volumeInfo.language != null) {
    if (volumeInfo.language == "en") {
      return Text(
        "English",
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          color: const Color(0xff0C0D36),
        ),
      );
    }
    if (volumeInfo.language == "id") {
      return Text(
        "Bahasa",
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          color: const Color(0xff0C0D36),
        ),
      );
    } else {
      return Text(
        volumeInfo.language!,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          color: const Color(0xff0C0D36),
        ),
      );
    }
  } else {
    return Text(
      "-",
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        color: const Color(0xff0C0D36),
      ),
    );
  }
}

Widget bookPublishedDate(VolumeInfo volumeInfo) {
  if (volumeInfo.publishedDate != null) {
    return Text(
      volumeInfo.publishedDate!,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        color: const Color(0xff0C0D36),
      ),
    );
  } else {
    return Text(
      "-",
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        color: const Color(0xff0C0D36),
      ),
    );
  }
}
