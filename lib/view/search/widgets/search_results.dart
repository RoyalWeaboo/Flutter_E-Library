import 'package:e_library/model/google_books_model.dart';
import 'package:e_library/view/search/widgets/book_detail.dart';
import 'package:e_library/view_model/bloc_search/search_bloc.dart';
import 'package:e_library/view_model/bloc_search/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../book_detail/widgets/book_detail/book_image.dart';
import 'book_availability.dart';
import 'book_type.dart';

Widget searchResults(BuildContext context) {
  return BlocBuilder<BookSearchBloc, BookSearchState>(
    builder: (context, state) {
      if (state is LoadingState) {
        return const Padding(
          padding: EdgeInsets.only(top: 16),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      if (state is SuccessState) {
        if (state.googleBooks.items != null) {
          List<Items> items = state.googleBooks.items!;
          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: items.length,
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
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: bookImage(items[index].volumeInfo!),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 8,
                              left: 16,
                              right: 4,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index].volumeInfo!.title!,
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                  ),
                                ),
                                bookAuthor(items[index].volumeInfo!),
                                bookAvailability(
                                    items[index].accessInfo!.viewability!),
                                const SizedBox(
                                  height: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: availableOn(
                                      items[index]
                                          .accessInfo!
                                          .epub!
                                          .isAvailable!,
                                      items[index]
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
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 8,
              );
            },
          );
        } else {
          return const Text("No Books Found");
        }
      }
      if (state is ErrorState) {
        return const Text("Something is wrong, try again later");
      }
      return Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
      );
    },
  );
}
