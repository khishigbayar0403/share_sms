import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_sms/providers/auth_provider.dart';
import 'package:share_sms/providers/theme_provider.dart';
import 'package:share_sms/widgets/form/custom_password_field.dart';
import 'package:share_sms/widgets/form/custom_text_field.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  static String path = "/login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  String phoneNumber = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: themeProvider.isDark
                  ? Brightness.light
                  : Brightness.dark, // For Android (dark icons)
              statusBarBrightness:
                  themeProvider.isDark ? Brightness.light : Brightness.dark),
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: 500,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/logo/logo.png",
                height: 160,
                width: 160,
              ),
              Text(
                "Welcome back",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .merge(const TextStyle(fontWeight: FontWeight.w700)),
              ),
              RichText(
                text: TextSpan(
                  text: 'Don\'t have an account. ',
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Register',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("register");
                          },
                        style: const TextStyle(color: Color(0xFF36bbb2))),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        keyboardType: TextInputType.number,
                        hintText: "Phone number",
                        prefix: Padding(
                          padding: const EdgeInsets.only(right: 8, left: 16),
                          child: Text(
                            "+976",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phonenumber';
                          }
                          return null;
                        },
                        onSaved: (String? newValue) {
                          phoneNumber = newValue ?? "";
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomPasswordField(
                        hintText: "Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (String? newValue) {
                          password = newValue ?? "";
                        },
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: FilledButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  if (phoneNumber == "99818676" &&
                                      password == "123") {
                                    authProvider.login();
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Invalid phonenumber or password')),
                                    );
                                  }
                                }
                              },
                              style: FilledButton.styleFrom(
                                minimumSize: const Size.fromHeight(48), // NEW),
                              ),
                              child: const Text("Login"))),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
