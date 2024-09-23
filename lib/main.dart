import 'package:fl_bases_web/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDarkMode: false).getTheme(),
      title: "Flutter",
      initialRoute: AppRouter.root,
      builder: (_, child) {
        return child ?? const CircularProgressIndicator();
      },
    );
  }
}
