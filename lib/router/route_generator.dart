import 'package:bases_web/ui/views/counter_provider_view.dart';
import 'package:bases_web/ui/views/counter_view.dart';
import 'package:bases_web/ui/views/view_404.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/stateful':
        return _fadeRoute(
            const CounterView(
              base: '5',
            ),
            '/stateful');
      case '/provider':
        return _fadeRoute(
            const CounterProviderView(
              base: '',
            ),
            '/provider');
      default:
        return _fadeRoute(const View404(), '/404');
    }
  }

  static PageRoute _fadeRoute(Widget child, String routeName) {
    return PageRouteBuilder(
      settings: RouteSettings(name: routeName),
      pageBuilder: (_, __, ___) => child,
      transitionsBuilder: (_, animation, __, ___) {
        if (kIsWeb) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        } else {
          return CupertinoPageTransition(
            primaryRouteAnimation: animation,
            secondaryRouteAnimation: __,
            linearTransition: true,
            child: child,
          );
        }
      },
    );
  }
}
