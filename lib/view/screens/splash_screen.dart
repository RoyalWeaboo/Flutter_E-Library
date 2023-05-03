import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: width,
            height: height * 0.8,
            child: Padding(
              padding: EdgeInsets.only(top: height * 0.2),
              child: const Image(
                image: AssetImage("assets/splash_screen_icon.png"),
              ),
            ),
          ),
          SizedBox(
            width: width,
            height: 0.2 * height,
            child: const Center(child: CircularProgressIndicator()),
          )
        ],
      ),
    );
  }
}
