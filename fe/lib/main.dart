import 'package:fitgoals/screens/IntroScreen/DiseaseSelectionScreen.dart';
import 'package:fitgoals/screens/Shared/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          fontFamily: GoogleFonts.beVietnamPro().fontFamily,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.redAccent, primary: Colors.redAccent)),
      home: SplashScreen(),
    );
  }
}
