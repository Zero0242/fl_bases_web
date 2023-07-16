import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) async {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  void goBack() => navigatorKey.currentState!.pop();
}
