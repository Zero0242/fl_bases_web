import 'package:bases_web/ui/shared/custom_appbar.dart';
import 'package:flutter/material.dart';

class MainLayoutPage extends StatelessWidget {
  const MainLayoutPage({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          const CustomAppMenu(),
          const Spacer(),
          Expanded(flex: 2, child: child),
          const Spacer(),
        ],
      ),
    );
  }
}
