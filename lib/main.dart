import 'package:fl_bases_web/config/config.dart';
import 'package:fl_bases_web/presentation/layouts/main_layout.dart';
import 'package:fl_bases_web/presentation/providers/theme_provider.dart';
import 'package:fl_bases_web/presentation/screens/screens.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerStatefulWidget {
  const MainApp({super.key});

  @override
  ConsumerState<MainApp> createState() => _MainAppState();
}

class _MainAppState extends ConsumerState<MainApp> {
  GetStorage get _storage => GetStorage();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((ts) {
      final key = _storage.read<String>(StorageKeys.theme);
      ref.read(themeProvider.notifier).setMode(key == 'dark');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
