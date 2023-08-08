import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:share_sms/providers/auth_provider.dart';
import 'package:share_sms/providers/theme_provider.dart';
import 'package:share_sms/screens/login.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  static String path = "/getStarted";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: themeProvider.isDark
                  ? Brightness.light
                  : Brightness.dark, // For Android (dark icons)
              statusBarBrightness:
                  themeProvider.isDark ? Brightness.light : Brightness.dark),
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/get_started.png",
              width: size.width / 6 * 5,
            ),
            Text(
              "Welcome to ShareSMS",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .merge(const TextStyle(fontWeight: FontWeight.w700)),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .merge(TextStyle(color: Colors.grey.shade500)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: () async {
                  authProvider.seenGetStartedPage();
                  context.replace(Login.path);
                },
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(48), // NEW),
                ),
                child: const Text("Get started"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
