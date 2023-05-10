import 'package:e_library/model/bookmark_model.dart';
import 'package:e_library/view_model/bloc_bookmark/bookmark_event.dart';
import 'package:e_library/view_model/radio_button_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../view_model/bloc_bookmark/bookmark_bloc.dart';

class UpdateBookmarkScreen extends StatefulWidget {
  const UpdateBookmarkScreen({
    super.key,
  });

  @override
  State<UpdateBookmarkScreen> createState() => _UpdateBookmarkScreenState();
}

class _UpdateBookmarkScreenState extends State<UpdateBookmarkScreen> {
  bool status = true;
  final updateFormKey = GlobalKey<FormState>();
  final pageController = TextEditingController();
  final notesController = TextEditingController();
  Bookmark? bookData;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final route = ModalRoute.of(context);
      if (route != null) {
        final Bookmark args = route.settings.arguments as Bookmark;
        bookData = args;
        pageController.text = bookData!.page;
        notesController.text = bookData!.notes;
        if (bookData!.readingStatus) {
          status = true;
        } else {
          status = false;
        }
      } else {
        bookData = Bookmark(
            authors: "",
            bookId: "",
            bookImageUrl: "",
            bookTitle: "",
            lastRead: "",
            page: "",
            readingStatus: false,
            bookUrl: "",
            saleAbility: "",
            notes: "",
            viewAbility: "");
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final radioButton = Provider.of<RadioButtonProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(
              'bookmarkdetail',
              arguments: bookData!.bookId,
            );
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: 0.83 * height,
            width: width,
            color: Colors.white,
            child: Column(
              children: [
                Expanded(
                  flex: 9,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 24, left: 32, right: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Image(
                          image: AssetImage("assets/main_icon.png"),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Update Bookmark Data",
                          style: GoogleFonts.playfairDisplay(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Form(
                          key: updateFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      'Page : ',
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14,
                                        color:
                                            const Color.fromARGB(166, 0, 0, 0),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: TextFormField(
                                      controller: pageController,
                                      decoration: const InputDecoration(
                                        isDense: true,
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'This field cant be empty';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        pageController.text = value!;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),
                              Text(
                                'Status : ',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: const Color.fromARGB(166, 0, 0, 0),
                                ),
                              ),
                              Consumer<RadioButtonProvider>(
                                builder: (context, value, child) {
                                  return Row(
                                    children: [
                                      Row(
                                        children: [
                                          Transform.scale(
                                            scale: 0.8,
                                            child: Radio<bool>(
                                              value: true,
                                              groupValue: value.reading,
                                              onChanged: (val) {
                                                value.reading = val!;
                                              },
                                            ),
                                          ),
                                          Transform.translate(
                                            offset: const Offset(-10, 0),
                                            child: Text(
                                              "Reading",
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
                                            child: Radio<bool>(
                                              value: false,
                                              groupValue: value.reading,
                                              onChanged: (val) {
                                                value.reading = val!;
                                              },
                                            ),
                                          ),
                                          Transform.translate(
                                            offset: const Offset(-10, 0),
                                            child: Text(
                                              "Completed",
                                              style: GoogleFonts.inter(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                        Text(
                          'Notes : ',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: const Color.fromARGB(166, 0, 0, 0),
                          ),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: notesController,
                          maxLines: 3,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: width,
                    color: const Color(0xffF7F9FB),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 32, right: 32, top: 12, bottom: 12),
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
                        onPressed: () {
                          context.read<BookmarkBloc>().add(
                                EditBookmark(
                                  bookData!.bookId,
                                  Bookmark(
                                      authors: bookData!.authors,
                                      bookId: bookData!.bookId,
                                      bookImageUrl: bookData!.bookImageUrl,
                                      bookTitle: bookData!.bookTitle,
                                      lastRead: DateFormat('MMM dd, yyyy')
                                          .format(DateTime.now().toLocal())
                                          .toString(),
                                      page: pageController.text,
                                      readingStatus: radioButton.reading,
                                      bookUrl: bookData!.bookUrl,
                                      saleAbility: bookData!.saleAbility,
                                      notes: notesController.text,
                                      viewAbility: bookData!.viewAbility),
                                ),
                              );

                          Navigator.pushReplacementNamed(
                            context,
                            'bookmarkdetail',
                            arguments: bookData!.bookId,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "Save",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
