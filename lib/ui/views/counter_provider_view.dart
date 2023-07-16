import 'package:bases_web/providers/counter_provider.dart';
import 'package:bases_web/ui/shared/custom_flatbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterProviderView extends StatelessWidget {
  const CounterProviderView({super.key, required this.base});
  final String base;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterProvider(base),
      child: Builder(builder: (context) {
        final counter = Provider.of<CounterProvider>(context);

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              fit: BoxFit.contain,
              child: Text(
                'Contador provider: ${counter.contador}',
                style:
                    const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomFlatButton(
                  label: 'Incrementar',
                  onPressed: counter.increment,
                ),
                CustomFlatButton(
                  label: 'Decrementar',
                  onPressed: counter.decrement,
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
