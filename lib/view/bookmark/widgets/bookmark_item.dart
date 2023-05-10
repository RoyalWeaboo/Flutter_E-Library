import 'package:e_library/model/bookmark_model.dart';
import 'package:e_library/view/bookmark/widgets/bookmark_book_image.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_bloc.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'reading_status.dart';

Widget bookmarkItem(BuildContext context) {
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
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (state is SuccessState) {
        List<Bookmark> data = state.data;
        if (data.isNotEmpty) {
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('bookmarkdetail',
                      arguments: data[index].bookId);
                },
                child: Card(
                  color: const Color(0xffF7F9FB),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          bookmarkBookImage(data[index].bookImageUrl),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                right: 4,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    data[index].bookTitle,
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Last Read : ",
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            data[index].lastRead,
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Page\t\t\t\t\t\t\t\t\t\t\t: ",
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            data[index].page,
                                            style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                  readingStatus(data[index].readingStatus),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8,
              );
            },
          );
        }
      }
      if (state is EmptyBookmarkState) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: const Center(
            child: Text("No Books"),
          ),
        );
      }

      return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
      );
    },
  );
}
