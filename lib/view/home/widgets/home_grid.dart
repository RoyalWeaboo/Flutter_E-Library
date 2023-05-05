import 'package:e_library/model/google_books_model.dart';
import 'package:e_library/view_model/bloc_book/book_bloc.dart';
import 'package:e_library/view_model/bloc_book/book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../book_detail/widgets/book_image.dart';

Widget homeGrid(BuildContext context) {
  return BlocBuilder<BookBloc, BookState>(
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
        List<Items> items = state.googleBooks.items!;
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Card(
                  color: const Color(0xffF7F9FB),
                  elevation: 8,
                  child: InkWell(
                    child: bookImage(items[index].volumeInfo!),
                    onTap: () => Navigator.of(context).pushNamed('bookdetail',
                        arguments: items[index].volumeInfo!),
                  ),
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
        );
      }
      if (state is ErrorState) {
        return const Text("Something is wrong, try again later");
      }
      return const Text("");
    },
  );
}
