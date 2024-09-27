import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'landing_page_provider.g.dart';

@riverpod
class LandingPage extends _$LandingPage {
  final List<String> _pages = const <String>[
    'home',
    'about',
    'pricing',
    'contact',
    'location',
  ];

  int _currentIndex = 0;

  @override
  PageController build(String routeName) {
    _currentIndex = !_pages.contains(routeName) ? 0 : _pages.indexOf(routeName);
    return PageController(
      initialPage: _currentIndex,
    );
    // ..addListener(
    //     () {
    //       final pageIndex = (scrollController.page ?? 0).round();
    //       if (pageIndex != _currentIndex) {
    //         html.document.title = _pages[pageIndex];

    //         html.window.history
    //             .pushState(null, 'none', '#/${_pages[pageIndex]}');
    //         _currentIndex = pageIndex;
    //       }
    //     },
    //   );
  }

  void goTo(int index) {
    // html.window.history.pushState(null, 'none', '#/${_pages[index]}');

    state.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
