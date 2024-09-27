import 'package:fl_bases_web/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_menu_item.dart';

class FloatingMenu extends ConsumerStatefulWidget {
  const FloatingMenu({super.key});

  @override
  ConsumerState<FloatingMenu> createState() => _FloatingMenuState();
}

class _FloatingMenuState extends ConsumerState<FloatingMenu>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = ref.read(landingPageProvider.notifier);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          setState(() => isOpen = !isOpen);
          isOpen ? _controller.forward() : _controller.reverse();
        },
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: isOpen ? 308 : kBottomNavigationBarHeight,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _MenuTitle(isOpen: isOpen, controller: _controller),
              if (isOpen) ...[
                CustomMenuItem(
                  text: 'Home',
                  onPressed: () => pageProvider.goTo(0),
                ),
                CustomMenuItem(
                  text: 'About',
                  delay: 30,
                  onPressed: () => pageProvider.goTo(1),
                ),
                CustomMenuItem(
                  text: 'Pricing',
                  delay: 60,
                  onPressed: () => pageProvider.goTo(2),
                ),
                CustomMenuItem(
                  text: 'Contact',
                  delay: 90,
                  onPressed: () => pageProvider.goTo(3),
                ),
                CustomMenuItem(
                  text: 'Location',
                  delay: 120,
                  onPressed: () => pageProvider.goTo(4),
                ),
                const SizedBox(height: 10),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    required this.isOpen,
    required AnimationController controller,
  }) : _controller = controller;

  final bool isOpen;
  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          width: isOpen ? 45 : 0,
        ),
        Text(
          'Menu',
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
        ),
        const Spacer(),
        AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _controller,
          color: Colors.white,
        ),
      ],
    );
  }
}
