import 'package:e_library/model/google_books_model.dart';
import 'package:flutter/material.dart';

Widget bookImage(VolumeInfo volumeInfo) {
  if (volumeInfo.imageLinks != null) {
    return Image(
      height: 200,
      width: 130,
      fit: BoxFit.scaleDown,
      image: NetworkImage(volumeInfo.imageLinks!.thumbnail!),
    );
  } else {
    return const Image(
      height: 200,
      width: 130,
      fit: BoxFit.fill,
      image: AssetImage('assets/no_cover.jpg'),
    );
  }
}
