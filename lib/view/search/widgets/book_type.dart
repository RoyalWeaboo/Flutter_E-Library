import 'package:flutter/material.dart';

Widget availableOn(bool isEpub, bool isPdf) {
  if (isEpub && isPdf) {
    return Row(
      children: const [
        Image(
          height: 20,
          fit: BoxFit.scaleDown,
          image: AssetImage('assets/epub_icon.png'),
        ),
        SizedBox(
          width: 8,
        ),
        Image(
          height: 20,
          fit: BoxFit.scaleDown,
          image: AssetImage('assets/pdf_icon.png'),
        ),
      ],
    );
  }
  if (isEpub && !isPdf) {
    return Row(
      children: const [
        Image(
          height: 20,
          fit: BoxFit.scaleDown,
          image: AssetImage('assets/epub_icon.png'),
        ),
        SizedBox(
          width: 8,
        ),
        Image(
          height: 20,
          fit: BoxFit.scaleDown,
          image: AssetImage('assets/no_pdf_icon.png'),
        ),
      ],
    );
  }
  if (!isEpub && isPdf) {
    return Row(
      children: const [
        Image(
          height: 20,
          fit: BoxFit.scaleDown,
          image: AssetImage('assets/no_epub_icon.png'),
        ),
        SizedBox(
          width: 8,
        ),
        Image(
          height: 20,
          fit: BoxFit.scaleDown,
          image: AssetImage('assets/pdf_icon.png'),
        ),
      ],
    );
  } else {
    return Row(
      children: const [
        Image(
          height: 20,
          fit: BoxFit.scaleDown,
          image: AssetImage('assets/no_epub_icon.png'),
        ),
        SizedBox(
          width: 8,
        ),
        Image(
          height: 20,
          fit: BoxFit.scaleDown,
          image: AssetImage('assets/no_pdf_icon.png'),
        ),
      ],
    );
  }
}
