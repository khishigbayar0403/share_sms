import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  static String path = "/splash";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  Brightness.light, // For Android (dark icons)
              statusBarBrightness: Brightness.light),
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent),
      backgroundColor: const Color(0xFF36bbb2),
      body: Center(
          child: Image.asset(
        "assets/logo/launcher_icon.png",
        height: 150,
        width: 150,
      )),
    );
  }
}
