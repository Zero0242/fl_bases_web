import 'package:bases_web/locator.dart';
import 'package:bases_web/services/navigation_service.dart';
import 'package:bases_web/ui/shared/custom_flatbutton.dart';
import 'package:flutter/material.dart';

class View404 extends StatelessWidget {
  const View404({super.key});

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
            onPressed: () =>
                locator<NavigationService>().navigateTo('/stateful'),
            label: 'Go back')
      ],
    );
  }
}
