import 'package:e_library/view/home/widgets/user.dart';
import 'package:e_library/view/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../view_model/bloc_book/book_bloc.dart';
import '../../../view_model/bloc_book/book_event.dart';
import '../widgets/home_grid.dart';
import '../widgets/slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<BookBloc>().add(
          FetchBooks(),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Image(
              image: AssetImage("assets/main_icon.png"),
            ),
          ),
        ],
      ),
      drawer: SafeArea(
        child: navigationDrawer(context),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 8),
              child: Align(
                alignment: Alignment.centerRight,
                child: userName(context),
              ),
            ),
            SizedBox(
              height: 160,
              child: homeSlider(),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 32,
                right: 32,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommended Books",
                    style: GoogleFonts.playfairDisplay(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  const Image(
                    image: AssetImage("assets/main_icon.png"),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                  left: 16,
                  right: 16,
                ),
                child: HomeGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
