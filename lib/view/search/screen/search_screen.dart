import 'package:e_library/view/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../view_model/bloc_search/search_bloc.dart';
import '../../../view_model/bloc_search/search_event.dart';
import '../widgets/search_results.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

enum SearchSubject { title, author, subject }

class _SearchScreenState extends State<SearchScreen> {
  final searchController = TextEditingController();
  SearchSubject _subject = SearchSubject.title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Image(
              image: AssetImage("assets/main_icon.png"),
            ),
          ),
        ],
      ),
      drawer: SafeArea(
        child: navigationDrawer(context),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
          color: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                color: Colors.transparent,
                elevation: 5,
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    if (_subject == SearchSubject.title) {
                      context.read<BookSearchBloc>().add(
                            SearchBooks(value, "intitle"),
                          );
                    }
                    if (_subject == SearchSubject.author) {
                      context.read<BookSearchBloc>().add(
                            SearchBooks(value, "inauthor"),
                          );
                    } else {
                      context.read<BookSearchBloc>().add(
                            SearchBooks(value, "subject"),
                          );
                    }
                  },
                  controller: searchController,
                  decoration: const InputDecoration(
                    prefixIcon: Image(
                      image: AssetImage("assets/search_icon.png"),
                    ),
                    hintText: 'Search books',
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    fillColor: Color(0xffF7F9FB),
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color.fromARGB(255, 224, 224, 224),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xff3879E9),
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'This field cant be empty';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    searchController.text = value!;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Transform.scale(
                          scale: 0.8,
                          child: Radio<SearchSubject>(
                            value: SearchSubject.title,
                            groupValue: _subject,
                            onChanged: (SearchSubject? value) {
                              setState(() {
                                _subject = value!;
                                print(value);
                              });
                            },
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-10, 0),
                          child: Text(
                            "Title",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.8,
                          child: Radio<SearchSubject>(
                            value: SearchSubject.author,
                            groupValue: _subject,
                            onChanged: (SearchSubject? value) {
                              setState(() {
                                _subject = value!;
                                print(value);
                              });
                            },
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-10, 0),
                          child: Text(
                            "Author",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.8,
                          child: Radio<SearchSubject>(
                            value: SearchSubject.subject,
                            groupValue: _subject,
                            onChanged: (SearchSubject? value) {
                              setState(() {
                                _subject = value!;
                                print(value);
                              });
                            },
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(-10, 0),
                          child: Text(
                            "Subject",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: searchResults(context, "", ""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
