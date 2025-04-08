import 'dart:math' as math;

import 'package:fl_bases_web/app/routes.dart';
import 'package:fl_bases_web/config/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_html/html.dart' as html;

part 'landing_page_provider.g.dart';

@riverpod
class LandingPage extends _$LandingPage {
  static const _routing = [
    HomeView.path,
    AboutView.path,
    PricingView.path,
    ContactView.path,
    LocationView.path,
  ];

  @override
  Raw<PageController> build() {
    // * La ruta principal del web
    final params = ref.watch(appRouterProvider).state.pathParameters;
    final path = params['path'] ?? HomeView.path;
    final initialPage = math.max(_routing.indexOf(path), 0);

    final scrollController = PageController(initialPage: initialPage);
    scrollController.addListener(_listener);
    ref.onDispose(() {
      scrollController.removeListener(_listener);
      scrollController.dispose();
    });
    return scrollController;
  }

  void _listener() {
    final pageIndex = state.page?.round() ?? 0;
    if (html.window.location.pathname != '/landing/${_routing[pageIndex]}') {
      html.document.title = _routing[pageIndex];
      html.window.history
          .pushState(null, 'none', '/landing/${_routing[pageIndex]}');
    }
  }

  void goTo(int index) {
    html.window.history.pushState(null, 'none', '/landing/${_routing[index]}');
    state.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
