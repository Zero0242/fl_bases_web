import 'package:fl_bases_web/presentation/providers/providers.dart';
import 'package:fl_bases_web/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'custom_flat_button.dart';

class CustomAppMenu extends ConsumerWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(themeProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Wrapper(
            maxWidth: constraints.maxWidth,
            actions: [
              CustomFlatButton(
                label: 'Contador Stateful',
                onPressed: () {
                  context.pushReplacement(HomeScreen.route);
                },
                color: Colors.black,
              ),
              CustomFlatButton(
                label: 'Contador Provider',
                onPressed: () {
                  context.pushReplacement(RiverScreen.route);
                },
                color: Colors.black,
              ),
              CustomFlatButton(
                label: 'Otra Pagina',
                onPressed: () {
                  final notfoundroute = "/${DateTime.now().toIso8601String()}";
                  context.pushReplacement(notfoundroute);
                },
                color: Colors.black,
              ),
              CustomFlatButton(
                label: 'Stateful 100',
                onPressed: () {
                  context.pushReplacement([HomeScreen.route, '/100'].join(''));
                },
                color: Colors.black,
              ),
              CustomFlatButton(
                label: 'Contador Provider 200',
                onPressed: () {
                  context.pushReplacement([RiverScreen.route, '/200'].join(''));
                },
                color: Colors.black,
              ),
              const Spacer(),
              IconButton(
                onPressed: ref.read(themeProvider.notifier).toggleMode,
                icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
              ),
            ],
          ),
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget Wrapper({required List<Widget> actions, required double maxWidth}) {
    if (maxWidth > 520) return Row(children: actions);
    return Column(children: actions);
  }
}
