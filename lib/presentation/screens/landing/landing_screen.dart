import 'package:fl_bases_web/presentation/views/landing/landing.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  static const String route = '/landing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: <double>[0.5, 0.5],
            colors: <Color>[Colors.pink, Colors.deepOrange],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            PageView(
              scrollDirection: Axis.vertical,
              children: const <Widget>[
                HomeView(),
                AboutView(),
                PricingView(),
                ContactView(),
                LocationView(),
              ],
            ),
            // Positioned(
            //   top: 20,
            //   right: 20,
            //   child: CustomAppMenu(),
            // ),
          ],
        ),
      ),
    );
  }
}
