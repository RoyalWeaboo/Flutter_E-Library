import 'package:e_library/model/bookmark_model.dart';
import 'package:e_library/model/google_books_model.dart';
import 'package:e_library/view/book_detail/widgets/book_detail/book_detail_bookmark_icon.dart';
import 'package:e_library/view/book_detail/widgets/book_detail/book_detail_button.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_bloc.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../widgets/book_detail/book_detail_description.dart';
import '../widgets/book_detail/book_details.dart';
import '../widgets/book_detail/book_detail_card.dart';
import '../widgets/book_detail/book_image.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  bool _showSnackbar = false;
  @override
  void initState() {
    super.initState();
    _showSnackbar = false;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final route = ModalRoute.of(context);
      if (route != null) {
        final Items args = route.settings.arguments as Items;
        context.read<BookmarkBloc>().add(
              FetchBookBookmarkStatus(args.id!),
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final Items args = ModalRoute.of(context)!.settings.arguments as Items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3879E9),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
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
                                  child: bookImage(args.volumeInfo!),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 32, right: 32, top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      args.volumeInfo!.title!,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 4,
                                  ),
                                  bookmarkIcon(
                                      context,
                                      _showSnackbar,
                                      args.id!,
                                      Bookmark(
                                          bookId: args.id!,
                                          bookImageUrl: args.volumeInfo!
                                              .imageLinks!.thumbnail!,
                                          bookTitle: args.volumeInfo!.title!,
                                          lastRead: DateFormat('MMM dd, yyyy')
                                              .format(DateTime.now().toLocal())
                                              .toString(),
                                          page: "0",
                                          notes: "",
                                          viewAbility:
                                              args.accessInfo!.viewability ??
                                                  "NO_PAGES",
                                          readingStatus: true,
                                          bookUrl: args.volumeInfo!
                                                  .canonicalVolumeLink ??
                                              "no link"))
                                ],
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              bookDetail(args.volumeInfo!),
                              const SizedBox(
                                height: 16,
                              ),
                              bookDescription(args.volumeInfo!),
                              const SizedBox(
                                height: 24,
                              ),
                              Text(
                                'Book Details',
                                style: GoogleFonts.playfairDisplay(
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff0C0D36),
                                ),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              bookDetailCard(args.volumeInfo!),
                              const SizedBox(
                                height: 32,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: const Color(0xffF7F9FB),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 12, bottom: 12),
                  child: bookDetailButton(args.accessInfo!),
                )),
          ),
        ],
      ),
    );
  }
}
