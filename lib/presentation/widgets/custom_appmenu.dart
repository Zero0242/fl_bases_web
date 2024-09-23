import 'package:flutter/material.dart';

import 'custom_flat_button.dart';

class CustomAppMenu extends StatelessWidget {
  const CustomAppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 520) {
          return const _DesktopMenu();
        } else {
          return const _MobileMenu();
        }
      },
    );
  }
}

class _DesktopMenu extends StatelessWidget {
  const _DesktopMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: <Widget>[
          CustomFlatButton(
            label: 'Contador Stateful',
            onPressed: () {},
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
            onPressed: () {},
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
  }
}

class _MobileMenu extends StatelessWidget {
  const _MobileMenu();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomFlatButton(
            label: 'Contador Stateful',
            onPressed: () {},
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
            onPressed: () {},
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
  }
}
