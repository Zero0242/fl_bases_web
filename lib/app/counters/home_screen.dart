import 'package:fl_bases_web/presentation/shared/shared.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.base});
  final String base;
  static const String route = '/counter';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _contador = 10;

  @override
  void initState() {
    _contador = int.tryParse(widget.base) ?? 10;
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
