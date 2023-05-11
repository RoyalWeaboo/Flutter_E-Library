import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerServiceWidget extends StatelessWidget {
  const CustomerServiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await whatsapp(context);
      },
      child: Text(
        "Customer Service",
        style: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
      ),
    );
  }
}

whatsapp(BuildContext context) async {
  var contact = "+880123232333";
  var androidUrl = "whatsapp://send?phone=$contact&text=Hi, I need some help";
  var iosUrl =
      "https://wa.me/$contact?text=${Uri.parse('Hi, I need some help')}";

  try {
    if (Platform.isIOS) {
      await launchUrl(Uri.parse(iosUrl));
    } else {
      await launchUrl(Uri.parse(androidUrl));
    }
  } on Exception {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('WhatsApp is not installed'),
      ),
    );
  }
}
