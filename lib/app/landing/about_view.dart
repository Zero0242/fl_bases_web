import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});
  static const String path = 'about';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pinkAccent,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'About view',
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
