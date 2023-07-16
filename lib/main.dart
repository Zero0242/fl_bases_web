import 'package:bases_web/router/router.dart';
import 'package:flutter/material.dart';
import 'package:bases_web/locator.dart';
import 'package:bases_web/services/navigation_service.dart';
import 'package:bases_web/ui/layouts/main_layout_page.dart';

void main() {
  setupLocator();
  WebAppRouter.configureRoutes();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Web Test App',
      initialRoute: '/',
      //onGenerateRoute: RouteGenerator.generateRoute,
      onGenerateRoute: WebAppRouter.router.generator,
      builder: (_, child) => MainLayoutPage(
        child: child ?? const CircularProgressIndicator(),
      ),
      navigatorKey: locator<NavigationService>().navigatorKey,
    );
  }
}
