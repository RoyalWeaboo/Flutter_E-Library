import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

Widget homeSlider() {
  final List<String> imgList = [
    'assets/slider_1.jpg',
    'assets/slider_2.jpg',
    'assets/slider_3.jpg',
  ];

  final List<Widget> imageSliders = imgList
      .map(
        (item) => ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: <Widget>[
              Image.asset(item, fit: BoxFit.fill, width: 1000.0),
            ],
          ),
        ),
      )
      .toList();

  return CarouselSlider(
    options: CarouselOptions(
      aspectRatio: 3.5,
      enlargeCenterPage: true,
      initialPage: 2,
      autoPlay: true,
    ),
    items: imageSliders,
  );
}
