import 'package:fl_bases_web/config/config.dart';
import 'package:fl_bases_web/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

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
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDarkMode: isDarkMode).getTheme(),
      title: "Flutter",
      routerConfig: appRouter,
    );
  }
}
