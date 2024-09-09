import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_4/pages/nav_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          primarySwatch: Colors.blue),
      home: const NavBar(),
    );
  }
}
