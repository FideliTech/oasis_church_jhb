import 'package:flutter/material.dart';

class SplashUI extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashUIState();
  }
}

class SplashUIState extends State<SplashUI> {
  @override
  Widget build(BuildContext context) {
    final bottomNavSelectedColor = const Color(0xFF7f6d1e);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white70,
            image: DecorationImage(
              image: AssetImage("assets/images/ocj_splash.png"),
            )),
      ),
    );
  }
}
