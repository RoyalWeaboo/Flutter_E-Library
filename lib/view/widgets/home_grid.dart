import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget homeGrid(BuildContext context) {
  return GridView.count(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    crossAxisCount: 2,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Card(
            color: const Color(0xffF7F9FB),
            elevation: 8,
            child: InkWell(
              child: const Image(
                image: AssetImage('assets/example_grid.png'),
              ),
              onTap: () => Navigator.of(context).pushNamed(
                'bookdetail',
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Card(
            color: const Color(0xffF7F9FB),
            elevation: 8,
            child: InkWell(
              child: const Image(
                image: AssetImage('assets/example_grid.png'),
              ),
              onTap: () => Navigator.of(context).pushNamed(
                'bookdetail',
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Card(
            color: const Color(0xffF7F9FB),
            elevation: 8,
            child: InkWell(
              child: const Image(
                image: AssetImage('assets/example_grid.png'),
              ),
              onTap: () => Navigator.of(context).pushNamed(
                'bookdetail',
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Card(
            color: const Color(0xffF7F9FB),
            elevation: 8,
            child: InkWell(
              child: const Image(
                image: AssetImage('assets/example_grid.png'),
              ),
              onTap: () => Navigator.of(context).pushNamed(
                'bookdetail',
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Card(
            color: const Color(0xffF7F9FB),
            elevation: 8,
            child: InkWell(
              child: const Image(
                image: AssetImage('assets/example_grid.png'),
              ),
              onTap: () => Navigator.of(context).pushNamed(
                'bookdetail',
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
