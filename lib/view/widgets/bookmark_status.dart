import 'package:flutter/material.dart';

Widget bookmarkStatus(String status) {
  if (status == "completed") {
    return const Image(
      image: AssetImage("assets/completed.png"),
    );
  } else {
    return const Image(
      image: AssetImage("assets/reading_icon.png"),
    );
  }
}
