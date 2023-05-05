import 'package:e_library/model/google_books_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bookmark/widgets/bookmark_icon.dart';
import '../widgets/book_description.dart';
import '../widgets/book_details.dart';
import '../widgets/book_details_card.dart';
import '../widgets/book_image.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    final args = ModalRoute.of(context)!.settings.arguments as VolumeInfo;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3879E9),
        elevation: 0,
      ),
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 0.33 * height,
                child: Stack(
                  children: [
                    Container(
                      height: 0.25 * height,
                      width: width,
                      decoration: const BoxDecoration(
                        color: Color(0xff3879E9),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      top: 40,
                      child: Align(
                        alignment: Alignment.center,
                        child: bookImage(args),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32, right: 32, top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            args.title!,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            status = !status;

                            setState(() {});
                          },
                          icon: bookmark(status),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    bookDetail(args),
                    const SizedBox(
                      height: 16,
                    ),
                    bookDescription(args),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Book Details',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff0C0D36),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    bookDetailCard(args),
                    const SizedBox(
                      height: 32,
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 6),
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xff3879E9),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "Read Book",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
