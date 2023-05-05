import 'package:flutter/material.dart';

Widget bookmark(bool bookmarkStatus) {
  if (!bookmarkStatus) {
    return const Image(
      height: 32,
      fit: BoxFit.contain,
      image: AssetImage('assets/bookmark.png'),
    );
  } else {
    return const Image(
      height: 32,
      fit: BoxFit.contain,
      image: AssetImage('assets/bookmarked.png'),
    );
  }
}
