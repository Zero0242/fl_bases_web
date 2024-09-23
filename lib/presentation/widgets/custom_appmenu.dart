import 'package:fl_bases_web/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'custom_flat_button.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
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
                onPressed: () {},
                color: Colors.black,
              ),
              CustomFlatButton(
                label: 'Otra Pagina',
                onPressed: () {},
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
                onPressed: () {},
                color: Colors.black,
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
