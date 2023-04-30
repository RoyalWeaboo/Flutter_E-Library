import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isHidden = true;

  @override
  void initState() {
    _isHidden = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
          width: width,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage("assets/main_icon.png"),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Login",
                style: GoogleFonts.playfairDisplay(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Text(
                "Please enter your email and password",
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
                      height: 16,
                    ),
                    Material(
                      color: Colors.transparent,
                      elevation: 5,
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: _isHidden,
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: _togglePasswordView,
                            child: Icon(
                              size: 20,
                              _isHidden
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
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: Text(
                  "Forgot Password ?",
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff3879E9),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 64),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
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
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              "Login",
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
                            "Don't have an account ?",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: const Color.fromARGB(125, 0, 0, 0),
                            ),
                          ),
                          Text(
                            " Register",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff3879E9),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
