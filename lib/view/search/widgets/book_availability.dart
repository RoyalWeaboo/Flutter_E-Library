import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget bookAvailability(String viweability) {
  if (viweability == "ALL_PAGES") {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Availability : ",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
        Text(
          "Free",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
  if (viweability == "PARTIAL") {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Availability : ",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
        Text(
          "Sample",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
      ],
    );
  } else {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          "Availability : ",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
        Text(
          "No Preview",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
