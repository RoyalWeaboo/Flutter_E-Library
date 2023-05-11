import 'package:e_library/view_model/bloc_bookmark/bookmark_bloc.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bookmark_book_detail/bookmark_detail.dart';
import '../widgets/bookmark_book_detail/bookmark_detail_button.dart';

class BookmarkBookDetailScreen extends StatefulWidget {
  const BookmarkBookDetailScreen({super.key});

  @override
  State<BookmarkBookDetailScreen> createState() =>
      _BookmarkBookDetailScreenState();
}

class _BookmarkBookDetailScreenState extends State<BookmarkBookDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final String args = ModalRoute.of(context)!.settings.arguments as String;
      context.read<BookmarkBloc>().add(
            FetchBookmarkedBookById(args),
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff3879E9),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('bookmark');
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              color: Colors.white,
              child: const SingleChildScrollView(
                child: BookmarkDetail(),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                color: const Color(0xffF7F9FB),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 32, right: 32, top: 12, bottom: 12),
                  child: bookmarkDetailButton(),
                )),
          ),
        ],
      ),
    );
  }
}
