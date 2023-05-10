import 'package:e_library/model/google_books_model.dart';
import 'package:e_library/view_model/bloc_book/book_bloc.dart';
import 'package:e_library/view_model/bloc_book/book_event.dart';
import 'package:e_library/view_model/bloc_book/book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../book_detail/widgets/book_detail/book_image.dart';

Widget homeGrid(BuildContext context) {
  List data = [];
  int index = 10;
  ScrollController scrollController = ScrollController();

  scrollController.addListener(() {
    if (scrollController.position.maxScrollExtent ==
        scrollController.position.pixels) {
      context.read<BookBloc>().add(
            FetchNextBooks(index),
          );
      index += 10;
    }
  });

  return BlocConsumer<BookBloc, BookState>(
    builder: (context, state) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GridView.builder(
              controller: scrollController,
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Card(
                      color: const Color(0xffF7F9FB),
                      elevation: 8,
                      child: InkWell(
                        child: bookImage(data[index].volumeInfo!),
                        onTap: () => Navigator.of(context)
                            .pushNamed('bookdetail', arguments: data[index]),
                      ),
                    ),
                  ),
                );
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
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
