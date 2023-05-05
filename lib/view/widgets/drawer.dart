import 'package:e_library/view/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget navigationDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(
            color: Color(0xff3879E9),
          ),
          accountName: Text(
            "E-Library",
            style: GoogleFonts.playfairDisplay(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          accountEmail: Text(
            "Version 1.0.0",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 12,
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          currentAccountPicture: const CircleAvatar(
            backgroundImage: AssetImage("assets/circular_main_icon.png"),
          ),
        ),
        ListTile(
          title: Text(
            "Home",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('home');
          },
        ),
        ListTile(
          title: Text(
            "Search",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('search');
          },
        ),
        ListTile(
          title: Text(
            "Bookmarks",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('bookmark');
          },
        ),
        ListTile(
          title: Text(
            "Profile",
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('profile');
          },
        ),
      ],
    ),
  );
}
