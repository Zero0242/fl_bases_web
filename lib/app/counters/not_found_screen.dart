import 'package:fl_bases_web/presentation/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'home_screen.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        const Text(
          '404',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 10,
          width: double.infinity,
        ),
        const Text(
          'No se encontró la pagina',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        CustomFlatButton(
          onPressed: () => context.go(HomeScreen.route),
          label: 'Go back',
        ),
      ],
    );
  }
}
