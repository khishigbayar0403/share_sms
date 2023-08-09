import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar(
      {Key? key, required this.selectedIndex, required this.onChange})
      : super(key: key);
  final int selectedIndex;
  final Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceTint.withAlpha(14),
      ),
      padding: const EdgeInsets.all(16),
      child: GNav(
        hoverColor: Theme.of(context).hoverColor,
        gap: 8,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        duration: const Duration(milliseconds: 400),
        // tabBackgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
        activeColor: Theme.of(context).colorScheme.primary,
        tabs: const [
          GButton(
            icon: Icons.message,
            text: 'Messages',
          ),
          GButton(
            icon: Icons.lan_rounded,
            text: 'Channels',
          ),
          GButton(
            icon: Icons.notifications,
            text: 'Notifications',
          )
        ],
        selectedIndex: selectedIndex,
        onTabChange: (index) {
          onChange(index);
        },
      ),
    );
  }
}
