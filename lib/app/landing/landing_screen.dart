import 'package:fl_bases_web/app/routes.dart';
import 'package:fl_bases_web/presentation/landing/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({
    super.key,
    this.view = HomeView.path,
  });
  final String view;
  static const String route = '/landing';

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.watch(landingPageProvider);
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
              controller: controller,
              scrollDirection: Axis.vertical,
              children: const <Widget>[
                HomeView(),
                AboutView(),
                PricingView(),
                ContactView(),
                LocationView(),
              ],
            ),
            const Positioned(
              top: 20,
              right: 20,
              child: FloatingMenu(),
            ),
          ],
        ),
      ),
    );
  }
}
