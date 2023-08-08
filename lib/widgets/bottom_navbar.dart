import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:share_sms/providers/theme_provider.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar(
      {Key? key, required this.selectedIndex, required this.onChange})
      : super(key: key);
  final int selectedIndex;
  final Function(int) onChange;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    final iconColor = themeProvider.isDark
        ? themeProvider.isDark
            ? Theme.of(context).colorScheme.onPrimaryContainer.withAlpha(210)
            : Theme.of(context).primaryColor
        : Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: GNav(
        hoverColor: Theme.of(context).hoverColor,
        gap: 8,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        duration: const Duration(milliseconds: 400),
        tabBackgroundColor:
            Theme.of(context).colorScheme.surfaceVariant.withAlpha(120),
        color: iconColor,
        activeColor: iconColor,
        tabs: const [
          GButton(
            icon: Icons.message,
            text: 'Message',
          ),
          GButton(
            icon: Icons.account_circle,
            text: 'Account',
          ),
          GButton(
            icon: Icons.business_outlined,
            text: 'Company',
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
