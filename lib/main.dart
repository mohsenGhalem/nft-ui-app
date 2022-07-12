import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nft_app_ui/constants.dart';
import 'package:nft_app_ui/screen/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nft Ui App',
      theme: ThemeData(
        primaryColor: Constants.nBg,
        tabBarTheme: TabBarTheme(),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Constants.nShadowW,
                fontWeight: FontWeight.bold,
                fontSize: 22)),
        canvasColor: Colors.transparent,
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      home: const OnBoardingScreen(),
    );
  }
}
