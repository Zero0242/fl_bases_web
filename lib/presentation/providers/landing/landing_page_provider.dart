import 'package:fl_bases_web/presentation/views/landing/landing.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:universal_html/html.dart' as html;

part 'landing_page_provider.g.dart';

@riverpod
class LandingPage extends _$LandingPage {
  @override
  PageController build() {
    final scrollController = PageController(
      initialPage: 0,
    );
    scrollController.addListener(() {
      final currentIndex = ref.read(landingPageIndexProvider);
      final pages = ref.read(landingPageRoutesProvider);

      final pageIndex = (scrollController.page ?? 0).round();
      if (pageIndex != currentIndex) {
        html.document.title = pages[pageIndex];
        html.window.history
            .pushState(null, 'none', '/landing/${pages[pageIndex]}');
        ref.read(landingPageIndexProvider.notifier).updateCount(pageIndex);
      }
    });
    return scrollController;
  }

  void goTo(int index) {
    final pages = ref.read(landingPageRoutesProvider);
    html.window.history.pushState(null, 'none', '/landing/${pages[index]}');

    state.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

@riverpod
class LandingPageIndex extends _$LandingPageIndex {
  @override
  int build() {
    return 0;
  }

  void updateCount(int update) {
    state = update;
  }
}

@riverpod
List<String> landingPageRoutes(LandingPageRoutesRef ref) {
  return [
    HomeView.path,
    AboutView.path,
    PricingView.path,
    ContactView.path,
    LocationView.path,
  ];
}
