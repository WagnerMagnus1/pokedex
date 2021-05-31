import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/app/pages/details/details_pokedex_page.dart';
import 'package:pokedex/app/pages/home/home_page.dart';
import 'package:pokedex/colors.dart';

import 'app/pages/splashscreen/splashscreen_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
        primaryColor: primaryColor
      ),
      home: SplashscreenPage(),
    );
  }
}
