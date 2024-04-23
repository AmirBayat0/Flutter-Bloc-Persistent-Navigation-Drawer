import 'package:flutter/material.dart';
import 'package:flutter_persistance_drawer/mianwrapper.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}
//
// Created by CodeWithFlexZ
// Tutorials on my YouTube
//
//! Instagram
//! @CodeWithFlexZ
//
//? GitHub
//? AmirBayat0
//
//* YouTube
//* Programming with FlexZ
//

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Persistance Navigation Drawer with Bloc',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: GoogleFonts.ubuntu().fontFamily,
      ),
      home: const Banner(
        message: 'FlexZ',
        location: BannerLocation.topEnd,
        child: MainWrapper(),
      ),
    );
  }
}
