import 'package:fl_bases_web/config/config.dart';
import 'package:fl_bases_web/presentation/layouts/main_layout.dart';
import 'package:fl_bases_web/presentation/providers/theme_provider.dart';
import 'package:fl_bases_web/presentation/screens/screens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(themeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDarkMode: isDarkMode).getTheme(),
      title: "Flutter",
      routerConfig: GoRouter(
        debugLogDiagnostics: kDebugMode,
        redirect: (context, state) async {
          if (state.uri.path == '/') return HomeScreen.route;
          return null;
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
      ),
    );
  }
}
