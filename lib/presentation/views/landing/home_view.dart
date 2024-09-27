import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static const String path = 'home';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Home',
            style: GoogleFonts.montserratAlternates(
              fontWeight: FontWeight.bold,
              fontSize: 80,
            ),
          ),
        ),
      ),
    );
  }
}
