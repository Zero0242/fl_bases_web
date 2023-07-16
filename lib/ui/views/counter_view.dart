import 'package:flutter/material.dart';

import '../shared/custom_flatbutton.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key, required this.base});
  final String base;

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int _contador = 10;

  @override
  void initState() {
    if (int.tryParse(widget.base) != null) {
      _contador = int.parse(widget.base);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FittedBox(
          fit: BoxFit.contain,
          child: Text(
            'Contador $_contador',
            style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomFlatButton(
              label: 'Incrementar',
              onPressed: () => setState(() => _contador++),
            ),
            CustomFlatButton(
              label: 'Decrementar',
              onPressed: () => setState(() => _contador--),
            ),
          ],
        ),
      ],
    );
  }
}
