import 'package:fl_bases_web/presentation/layouts/main_layout.dart';
import 'package:fl_bases_web/presentation/screens/screens.dart';
import 'package:fl_bases_web/presentation/views/landing/landing.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: LandingScreen.route,
    debugLogDiagnostics: kDebugMode,
    redirect: (context, state) async {
      if (state.uri.path == '/') return HomeScreen.route;
      return null;
    },
    errorBuilder: (context, state) {
      return const MainLayoutPage(child: NotFoundScreen());
    },
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainLayoutPage(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            path: HomeScreen.route,
            builder: (_, __) => const HomeScreen(base: '0'),
          ),
          GoRoute(
            path: '${HomeScreen.route}/:count',
            builder: (context, state) {
              final base = state.pathParameters['count'] ?? '0';
              return HomeScreen(base: base);
            },
          ),
          GoRoute(
            path: RiverScreen.route,
            builder: (_, __) => const RiverScreen(count: '0'),
          ),
          GoRoute(
            path: '${RiverScreen.route}/:count',
            builder: (context, state) {
              final count = state.pathParameters['count'] ?? '0';
              return RiverScreen(count: count);
            },
          ),
        ],
      ),
      GoRoute(
        path: LandingScreen.route,
        redirect: (_, __) => '${LandingScreen.route}/${HomeView.path}',
      ),
      GoRoute(
        path: '${LandingScreen.route}/:path',
        builder: (context, state) {
          final path = state.pathParameters['path'] ?? HomeView.path;
          return LandingScreen(view: path);
        },
      ),
    ],
  );
}
