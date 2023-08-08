import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_sms/providers/auth_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Center(
        child: FilledButton(
      onPressed: () {
        authProvider.logout();
      },
      child: const Text("Logout"),
    ));
  }
}
