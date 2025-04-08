import 'package:fl_bases_web/app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/providers.dart';
import 'custom_flat_button.dart';

class CustomAppMenu extends ConsumerWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isDarkMode = ref.watch(themeProvider).valueOrNull ?? false;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Wrapper(
            maxWidth: constraints.maxWidth,
            actions: <Widget>[
              CustomFlatButton(
                label: 'Contador Stateful',
                onPressed: () {
                  context.go(HomeScreen.route);
                },
                color: Colors.black,
              ),
              CustomFlatButton(
                label: 'Contador Provider',
                onPressed: () {
                  context.go(RiverScreen.route);
                },
                color: Colors.black,
              ),
              CustomFlatButton(
                label: 'Otra Pagina',
                onPressed: () {
                  final notfoundroute = "/${DateTime.now().toIso8601String()}";
                  context.go(notfoundroute);
                },
                color: Colors.black,
              ),
              CustomFlatButton(
                label: 'Stateful 100',
                onPressed: () {
                  context.go([HomeScreen.route, '/100'].join());
                },
                color: Colors.black,
              ),
              CustomFlatButton(
                label: 'Contador Provider 200',
                onPressed: () {
                  context.go([RiverScreen.route, '/200'].join());
                },
                color: Colors.black,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    onPressed: ref.read(themeProvider.notifier).toggleMode,
                    icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                  ),
                  IconButton(
                    onPressed: () {
                      context.go(LandingScreen.route);
                    },
                    icon: const Icon(Icons.exit_to_app),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  Widget Wrapper({required List<Widget> actions, required double maxWidth}) {
    if (maxWidth > 520) {
      return Wrap(
        runAlignment: WrapAlignment.spaceBetween,
        alignment: WrapAlignment.spaceBetween,
        children: actions,
      );
    }
    return Column(children: actions);
  }
}
