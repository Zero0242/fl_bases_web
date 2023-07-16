import 'package:bases_web/services/navigation_service.dart';
import 'package:bases_web/ui/shared/custom_flatbutton.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

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
            onPressed: () =>
                locator<NavigationService>().navigateTo('/stateful'),
            color: Colors.black,
          ),
          CustomFlatButton(
            label: 'Contador Provider',
            onPressed: () =>
                locator<NavigationService>().navigateTo('/provider'),
            color: Colors.black,
          ),
          CustomFlatButton(
            label: 'Otra Pagina',
            onPressed: () =>
                locator<NavigationService>().navigateTo('/ppsososos'),
            color: Colors.black,
          ),
          CustomFlatButton(
            label: 'Stateful 100',
            onPressed: () =>
                locator<NavigationService>().navigateTo('/stateful/100'),
            color: Colors.black,
          ),
          CustomFlatButton(
            label: 'Contador Provider 200',
            onPressed: () =>
                locator<NavigationService>().navigateTo('/provider?q=200'),
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
            onPressed: () =>
                locator<NavigationService>().navigateTo('/stateful'),
            color: Colors.black,
          ),
          CustomFlatButton(
            label: 'Contador Provider',
            onPressed: () =>
                locator<NavigationService>().navigateTo('/provider'),
            color: Colors.black,
          ),
          CustomFlatButton(
            label: 'Otra Pagina',
            onPressed: () =>
                locator<NavigationService>().navigateTo('/ppsososos'),
            color: Colors.black,
          ),
          CustomFlatButton(
            label: 'Stateful 100',
            onPressed: () =>
                locator<NavigationService>().navigateTo('/stateful/100'),
            color: Colors.black,
          ),
          CustomFlatButton(
            label: 'Contador Provider 200',
            onPressed: () =>
                locator<NavigationService>().navigateTo('/provider?q=200'),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
