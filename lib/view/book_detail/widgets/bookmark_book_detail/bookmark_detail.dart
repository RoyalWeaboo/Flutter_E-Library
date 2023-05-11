import 'package:e_library/view/bookmark/widgets/bookmark_book_image.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_bloc.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bookmark_book_detail_card.dart';
import 'bookmark_icon.dart';
import 'bookmark_notes.dart';

class BookmarkDetail extends StatelessWidget {
  const BookmarkDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return BlocConsumer<BookmarkBloc, BookmarkState>(
      listener: (context, state) {
        if (state is ErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is LoadingState) {
          return Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is SuccessState) {
          final data = state.data[0];
          return Column(
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
                        child: bookmarkBookImage(data.bookImageUrl),
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
                            data.bookTitle,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        BookmarkIcon(
                          bookId: data.bookId,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14.0,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "by ",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: data.authors,
                            style: GoogleFonts.playfairDisplay(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: const Color(0xff3879E9),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Book Details',
                          style: GoogleFonts.playfairDisplay(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: const Color(0xff0C0D36),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              'updatebookmark',
                              arguments: data,
                            );
                          },
                          icon: const Image(
                            image: AssetImage('assets/pencil_icon.png'),
                          ),
                        ),
                      ],
                    ),
                    bookmarkDetailCard(data),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Bookmark Notes',
                      style: GoogleFonts.playfairDisplay(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: const Color(0xff0C0D36),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    bookmarkDetailNotes(data.notes),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        return Container(
          color: Colors.white,
        );
      },
    );
  }
}
