import 'package:fl_bases_web/presentation/layouts/main_layout.dart';
import 'package:fl_bases_web/presentation/screens/screens.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
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
            builder: (context, state) {
              return const HomeScreen(base: '0');
            },
            routes: [
              GoRoute(
                path: ':count',
                builder: (context, state) {
                  final base = state.pathParameters['count'] ?? '0';
                  return HomeScreen(base: base);
                },
              ),
            ],
          ),
          GoRoute(
            path: RiverScreen.route,
            builder: (context, state) {
              return const RiverScreen();
            },
            routes: [
              GoRoute(
                path: ':count',
                builder: (context, state) {
                  final base = state.pathParameters['count'] ?? '0';
                  return RiverScreen(count: base);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
