import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter",
      // routes: AppRouter.rutasApp,
      // initialRoute: AppRouter.root,
      home: TemporalScreen(),
    );
  }
}

class TemporalScreen extends StatelessWidget {
  const TemporalScreen({super.key});
  static const String route = '/route';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Title')),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: const Text('TemporalScreen Screen body'),
      ),
    );
  }
}
