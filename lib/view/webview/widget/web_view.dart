import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget webViewPage(String bookId, String saleAbility) {
  late final WebViewController controller;

  if (saleAbility == "FOR_SALE") {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
            'https://play.google.com/books/reader?id=$bookId&pg=GBS.PP1&hl=en'),
      );
    return WebViewWidget(controller: controller);
  } else {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
            'https://books.google.co.id/books?id=$bookId&printsec=frontcover&hl=id&source=gbs_ge_summary_r&cad=0#v=onepage&q&f=false'),
      );
    return WebViewWidget(controller: controller);
  }
}
