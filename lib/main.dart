import 'package:fl_bases_web/config/config.dart';
import 'package:fl_bases_web/presentation/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  await StoragePlugin.init();
  usePathUrlStrategy();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode =
        ref.watch(themeProvider).whenData((e) => e).value ?? false;
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(isDarkMode: isDarkMode).getTheme(),
      title: "Flutter",
      routerConfig: appRouter,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
