import 'package:fl_bases_web/presentation/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverScreen extends ConsumerWidget {
  const RiverScreen({super.key, this.count});
  static const String route = '/river-counter';
  final String? count;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider(count));
    final notifier = ref.read(counterProvider(count).notifier);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Contador provider: $counter',
            style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomFlatButton(
              label: 'Incrementar',
              onPressed: notifier.increase,
            ),
            CustomFlatButton(
              label: 'Decrementar',
              onPressed: notifier.decrease,
            ),
          ],
        ),
      ],
    );
  }
}
