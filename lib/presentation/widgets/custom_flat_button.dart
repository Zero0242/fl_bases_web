import 'package:flutter/material.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton({
    super.key,
    this.onPressed,
    this.label,
    this.color = Colors.pink,
  });
  final VoidCallback? onPressed;
  final String? label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(foregroundColor: color),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          label ?? 'Press me',
        ),
      ),
    );
  }
}
