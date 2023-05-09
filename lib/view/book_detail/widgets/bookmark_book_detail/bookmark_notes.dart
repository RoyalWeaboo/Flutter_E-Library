import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget bookmarkDetailNotes(String notes) {
  if (notes != "") {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Text(
        notes,
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  } else {
    return Padding(
      padding: const EdgeInsets.only(left: 2),
      child: Text(
        "-",
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
