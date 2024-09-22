import 'package:fitgoals/features/splash/presentation/pages/splash_screen.dart';
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
          seedColor: const Color(0xFFD21312),
          primary: const Color(0xFFD21312),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
