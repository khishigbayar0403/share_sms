import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_sms/providers/auth_provider.dart';
import 'package:share_sms/providers/theme_provider.dart';

class ChannelsPage extends StatelessWidget {
  const ChannelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Center(
      child: Column(
        children: [
          FilledButton.tonal(
            onPressed: () {
              authProvider.logout();
            },
            child: const Text("Logout"),
          ),
          FilledButton(
            onPressed: () {
              themeProvider.changeTheme();
            },
            child: const Text("Change theme"),
          )
        ],
      ),
    );
  }
}
