import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactView extends StatelessWidget {
  const ContactView({super.key});
  static const String path = 'contact';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purpleAccent,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Contact view',
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
