import 'package:e_library/model/book_webpage_model.dart';
import 'package:e_library/view/webview/widget/web_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BookWebPageScreen extends StatefulWidget {
  const BookWebPageScreen({super.key});

  @override
  State<BookWebPageScreen> createState() => _BookWebPageScreenState();
}

class _BookWebPageScreenState extends State<BookWebPageScreen> {
  late final WebViewController controller;

  @override
  Widget build(BuildContext context) {
    final WebBookData args =
        ModalRoute.of(context)!.settings.arguments as WebBookData;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff3879E9),
          title: Text("${args.bookTitle} (${args.viewAbility})"),
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () async {
                  if (args.saleAbility == "FOR_SALE") {
                    await launchUrl(
                      Uri.parse(
                          'https://play.google.com/books/reader?id=${args.bookId}&pg=GBS.PP1&hl=en'),
                    );
                  } else {
                    await launchUrl(
                      Uri.parse(
                          'https://books.google.co.id/books?id=${args.bookId}&printsec=frontcover&hl=id&source=gbs_ge_summary_r&cad=0#v=onepage&q&f=false'),
                    );
                  }
                },
                icon: const Icon(Icons.launch))
          ],
        ),
        body: webViewPage(args.bookId, args.saleAbility));
  }
}
