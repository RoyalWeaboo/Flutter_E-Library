import 'package:e_library/model/bookmark_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget bookmarkDetailCard(Bookmark bookmark) {
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
              Text(
                bookmark.page,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff0C0D36),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "Page",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff0C0D36),
                ),
              ),
            ],
          ),
          Column(
            children: [
              bookmarkStatus(bookmark),
              const SizedBox(
                height: 2,
              ),
              Text(
                "Status",
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff0C0D36),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                bookmark.lastRead,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff0C0D36),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "Last Read",
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

Widget bookmarkStatus(Bookmark bookmark) {
  if (bookmark.readingStatus) {
    return Text(
      "Reading",
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        color: const Color(0xff0C0D36),
      ),
    );
  } else {
    return Text(
      "Completed",
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        color: const Color(0xff0C0D36),
      ),
    );
  }
}
