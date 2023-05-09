import 'package:e_library/model/google_books_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

RichText bookDetail(VolumeInfo volumeInfo) {
  if (volumeInfo.authors != null) {
    int authorCount = volumeInfo.authors!.length;
    if (authorCount == 1) {
      return RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 14.0,
          ),
          children: <TextSpan>[
            TextSpan(
              text: "by ",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: volumeInfo.authors![0],
              style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: const Color(0xff3879E9),
              ),
            ),
          ],
        ),
      );
    } else {
      return RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 14.0,
          ),
          children: <TextSpan>[
            TextSpan(
              text: "by ",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            TextSpan(
              text: '${volumeInfo.authors![0]} & $authorCount others',
              style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                fontSize: 14,
                color: const Color(0xff3879E9),
              ),
            ),
          ],
        ),
      );
    }
  } else {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontSize: 14.0,
        ),
        children: <TextSpan>[
          TextSpan(
            text: "by ",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'Unknown',
            style: GoogleFonts.playfairDisplay(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              fontSize: 14,
              color: const Color(0xff3879E9),
            ),
          )
        ],
      ),
    );
  }
}
