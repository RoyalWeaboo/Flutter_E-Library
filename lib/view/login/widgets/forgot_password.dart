// ignore_for_file: use_build_context_synchronously

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget forgotPassword(BuildContext context) {
  final dialogFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  return InkWell(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Forgot Your Password ?'),
            content: Form(
              key: dialogFormKey,
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email address';
                  }
                  if (!EmailValidator.validate(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  if (dialogFormKey.currentState!.validate()) {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: emailController.text);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Send Email'),
              ),
            ],
          );
        },
      );
    },
    child: Text(
      "Forgot Password ?",
      style: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: const Color(0xff3879E9),
      ),
    ),
  );
}
