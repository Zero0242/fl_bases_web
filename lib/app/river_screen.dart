import 'package:fl_bases_web/presentation/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverScreen extends ConsumerStatefulWidget {
  const RiverScreen({super.key, this.count});
  static const String route = '/river-counter';
  final String? count;

  @override
  ConsumerState<RiverScreen> createState() => _RiverScreenState();
}

class _RiverScreenState extends ConsumerState<RiverScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((ts) {
      final count = int.tryParse(widget.count ?? '');
      if (count == null) return;
      ref.read(counterProvider.notifier).setCount(count);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counterProvider);
    final notifier = ref.read(counterProvider.notifier);
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
