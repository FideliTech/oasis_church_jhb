import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oasis_church_jhb/reources/strings_resource.dart';
import 'package:oasis_church_jhb/splash/splash_ui.dart';
import 'package:oasis_church_jhb/utils/colors_util.dart';
import 'package:oasis_church_jhb/views/base/base_ui.dart';

void main() => runApp(OCJApp());

class OCJApp extends StatefulWidget {
  @override
  _OCJAppState createState() => _OCJAppState();
}

class _OCJAppState extends State<OCJApp> {
  Timer _timer;
  bool hasLoaded = false;

  _OCJAppState() {
    _timer = new Timer(const Duration(milliseconds: 4000), () {
      setState(() {
        hasLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    MaterialColor primaryColor =
    MaterialColor(0xFF4dc2e3, ColorsUtil.primaryColorMap);
    return MaterialApp(
      title: StringsResource.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: primaryColor,
//          primaryColor: Colors.white,
          textSelectionColor: primaryColor,
          highlightColor: primaryColor,
          hintColor: Colors.white70,
          unselectedWidgetColor: Colors.white70,
      ),
      home: hasLoaded ? BaseUI() : SplashUI(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }
}

