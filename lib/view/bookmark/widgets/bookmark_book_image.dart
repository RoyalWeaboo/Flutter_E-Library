import 'package:flutter/material.dart';

Widget bookmarkBookImage(String url) {
  if (url != "") {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 8),
      child: Image(
        height: 200,
        width: 130,
        fit: BoxFit.cover,
        image: NetworkImage(url),
      ),
    );
  } else {
    return const Padding(
      padding: EdgeInsets.only(top: 16, bottom: 16, left: 8),
      child: Image(
        height: 200,
        width: 130,
        fit: BoxFit.fill,
        image: AssetImage('assets/no_cover.jpg'),
      ),
    );
  }
}
