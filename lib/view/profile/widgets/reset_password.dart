// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordDialog extends StatelessWidget {
  const ChangePasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final changePasswordDialogFormKey = GlobalKey<FormState>();
    final newPassController = TextEditingController();
    final confirmNewPassController = TextEditingController();

    return InkWell(
      onTap: () async {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          if (user.emailVerified) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Change Password'),
                  content: Form(
                    key: changePasswordDialogFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: newPassController,
                          decoration: const InputDecoration(
                            labelText: 'New Password',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field cant be empty';
                            }
                            if (value.length < 8) {
                              return 'Password length must be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: confirmNewPassController,
                          decoration: const InputDecoration(
                            labelText: 'Confirm New Password',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This field cant be empty';
                            }
                            if (value != newPassController.text) {
                              return 'Password is not same';
                            }
                            return null;
                          },
                        ),
                      ],
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
                        if (changePasswordDialogFormKey.currentState!
                            .validate()) {
                          await user.updatePassword(newPassController.text);

                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Password succesfully changed.",
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ],
                );
              },
            );
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Unverified Email'),
                  content: const Text(
                      'To change your password you are required to verify your email. Verify your email now?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () async {
                        await user.sendEmailVerification();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Verification email sent, please check your email and re-login after verifying.",
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      },
                      child: const Text('Yes'),
                    ),
                  ],
                );
              },
            );
          }
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: const Color(0xffF7F9FB),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage('assets/password_icon.png'),
                height: 24,
                fit: BoxFit.fitHeight,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  "Change Password",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
