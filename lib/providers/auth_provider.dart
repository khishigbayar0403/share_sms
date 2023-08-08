import 'dart:async';

import 'package:flutter/material.dart';
import 'package:share_sms/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuth = false;
  bool _loading = true;
  bool _seenGetStarted = false;

  bool get isAuth => _isAuth;
  bool get loading => _loading;
  bool get seenGetStarted => _seenGetStarted;

  final StreamController<String> _onAuthState = StreamController.broadcast();

  Stream<String> get onIsAuthChange => _onAuthState.stream;

  void init() async {
    final prefs = await SharedPreferences.getInstance();
    String authState = prefs.getString('authState') ?? "";
    _seenGetStarted = prefs.getBool('seenGetStarted') ?? false;

    dPrint("seen ${_seenGetStarted} auth ${authState}");
    if (authState.isNotEmpty && authState == "authenticated") {
      _onAuthState.add(authState);
      _isAuth = true;
    } else {
      _onAuthState.add("unauthenticated");
      _isAuth = false;
    }
    _loading = false;
    await Future.delayed(const Duration(seconds: 1));
    notifyListeners();
  }

  void login() async {
    _onAuthState.add("authenticated");
    _isAuth = true;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('authState', "authenticated");
    notifyListeners();
  }

  void logout() async {
    _onAuthState.add("unauthenticated");
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('authState');
    _isAuth = false;
    notifyListeners();
  }

  seenGetStartedPage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("seenGetStarted", true);
    _seenGetStarted = true;
    notifyListeners();
  }
}
