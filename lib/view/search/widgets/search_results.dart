import 'package:e_library/model/google_books_model.dart';
import 'package:e_library/view/search/widgets/book_detail.dart';
import 'package:e_library/view_model/bloc_search/search_bloc.dart';
import 'package:e_library/view_model/bloc_search/search_event.dart';
import 'package:e_library/view_model/bloc_search/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../book_detail/widgets/book_detail/book_image.dart';
import 'book_availability.dart';
import 'book_type.dart';

Widget searchResults(
    BuildContext context, String searchQuery, String searchSubject) {
  List data = [];
  int index = 10;
  ScrollController searchScrollController = ScrollController();

  searchScrollController.addListener(() {
    if (searchScrollController.position.maxScrollExtent ==
        searchScrollController.position.pixels) {
      context.read<BookSearchBloc>().add(
            SearchNextBook(searchQuery, searchSubject, index),
          );
      index += 10;
    }
  });
  return BlocConsumer<BookSearchBloc, BookSearchState>(
    builder: (context, state) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ListView.separated(
              controller: searchScrollController,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color(0xffF7F9FB),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                    ),
                    child: IntrinsicHeight(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed('bookdetail', arguments: data[index]);
                        },
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: bookImage(data[index].volumeInfo!),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  left: 16,
                                  right: 4,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index].volumeInfo!.title!,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                    bookAuthor(data[index].volumeInfo!),
                                    bookAvailability(
                                        data[index].accessInfo!.viewability!),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16),
                                      child: availableOn(
                                          data[index]
                                              .accessInfo!
                                              .epub!
                                              .isAvailable!,
                                          data[index]
                                              .accessInfo!
                                              .pdf!
                                              .isAvailable!),
                                    ),
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
            ),
          ),
          Visibility(
            visible: state is LoadingState,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      );
    },
    listener: (context, state) {
      if (state is SuccessState) {
        List<Items> items = state.googleBooks.items!;

        data.addAll(items);
      }
      if (state is ErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Something is wrong, try again later"),
          ),
        );
      }
    },
  );
}
