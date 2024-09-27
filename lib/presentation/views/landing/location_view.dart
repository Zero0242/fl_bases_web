import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});
  static const String path = 'location';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepOrange,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Location view',
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
