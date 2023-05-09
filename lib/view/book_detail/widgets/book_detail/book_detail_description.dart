import 'package:e_library/model/google_books_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget bookDescription(VolumeInfo volumeInfo) {
  if (volumeInfo.description != null) {
    return Text(
      volumeInfo.description!,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
      ),
    );
  } else {
    return Text(
      "No Description Available",
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
