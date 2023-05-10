import 'package:e_library/model/book_webpage_model.dart';
import 'package:e_library/model/google_books_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget bookDetailButton(BuildContext context, Items item) {
  if (item.accessInfo != null) {
    if (item.accessInfo!.viewability == "ALL_PAGES") {
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
            Navigator.pushNamed(
              context,
              'webview',
              arguments: WebBookData(
                bookId: item.id!,
                bookTitle: item.volumeInfo!.title!,
                viewAbility: item.accessInfo!.viewability!,
                saleAbility: item.saleInfo!.saleability!,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "Read Book",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ),
      );
    }
    if (item.accessInfo!.viewability == "PARTIAL") {
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
            Navigator.pushNamed(
              context,
              'webview',
              arguments: WebBookData(
                bookId: item.id!,
                bookTitle: item.volumeInfo!.title!,
                viewAbility: item.accessInfo!.viewability!,
                saleAbility: item.saleInfo!.saleability!,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              "Read Sample",
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
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
