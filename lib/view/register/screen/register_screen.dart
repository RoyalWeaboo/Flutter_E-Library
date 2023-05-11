import 'package:e_library/view/register/widgets/register.dart';
import 'package:e_library/view_model/bloc_auth/auth_event.dart';
import 'package:e_library/view_model/password_visibility_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../view_model/bloc_auth/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: height,
            width: width,
            padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
            color: Colors.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  image: AssetImage("assets/main_icon.png"),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Registration",
                  style: GoogleFonts.playfairDisplay(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Please enter the required information to register a new account.",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    color: const Color.fromARGB(125, 0, 0, 0),
                    fontSize: 13,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 5,
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            hintText: 'Email',
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
                            if (!EmailValidator.validate(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            emailController.text = value!;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Material(
                        color: Colors.transparent,
                        elevation: 5,
                        child: TextFormField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            hintText: 'Username',
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
                            emailController.text = value!;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Consumer<PasswordButtonProvider>(
                        builder: (context, value, child) {
                          return Material(
                            color: Colors.transparent,
                            elevation: 5,
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: value.isHidden,
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: _togglePasswordVisibility,
                                  child: Icon(
                                    size: 20,
                                    value.isHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                hintText: 'Password',
                                fillColor: const Color(0xffF7F9FB),
                                filled: true,
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 224, 224, 224),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
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
                                if (value.length < 6 && value.length > 20) {
                                  return 'Password length must be between 6-20 characters';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                emailController.text = value!;
                              },
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Consumer<PasswordButtonProvider>(
                        builder: (context, value, child) {
                          return Material(
                            color: Colors.transparent,
                            elevation: 5,
                            child: TextFormField(
                              controller: confirmPasswordController,
                              obscureText: value.isConfirmHidden,
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: _toggleConfirmPasswordVisibility,
                                  child: Icon(
                                    size: 20,
                                    value.isConfirmHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                ),
                                hintText: 'Confirm Password',
                                fillColor: const Color(0xffF7F9FB),
                                filled: true,
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Color.fromARGB(255, 224, 224, 224),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
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
                                if (value.length < 6 && value.length > 20) {
                                  return 'Password length must be between 6-20 characters';
                                }
                                return null;
                              },
                              onSaved: (value) {
                                emailController.text = value!;
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(24),
                  child: Center(
                    child: RegisterState(),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 64),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Color.fromARGB(125, 0, 0, 0),
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "By clicking register, you agree with our ",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                color: const Color.fromARGB(125, 0, 0, 0),
                              ),
                            ),
                            TextSpan(
                              text: 'Terms and Condition',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff3879E9),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 6),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xff3879E9),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    Register(
                                        emailController.text,
                                        usernameController.text,
                                        passwordController.text),
                                  );
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              "Register",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            "Already have an account ?",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(125, 0, 0, 0),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('login');
                            },
                            child: Text(
                              "  Login",
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff3879E9),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    context.read<PasswordButtonProvider>().changeVisibility();
  }

  void _toggleConfirmPasswordVisibility() {
    context.read<PasswordButtonProvider>().changeConfirmVisibility();
  }
}
