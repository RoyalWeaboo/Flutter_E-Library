
import 'package:flutter/material.dart';

Widget readingStatus(bool status) {
  if (status) {
    return const Image(
      image: AssetImage("assets/reading_icon.png"),
    );
  } else {
    return const Image(
      image: AssetImage("assets/completed.png"),
    );
  }
}
