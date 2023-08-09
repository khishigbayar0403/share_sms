import 'package:flutter/material.dart';
import 'package:share_sms/screens/home/pages/channels_page.dart';
import 'package:share_sms/screens/home/pages/messages_page.dart';
import 'package:share_sms/screens/home/pages/notifications_page.dart';
import 'package:share_sms/widgets/bottom_navbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static String path = "/";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  bool _jump = false;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _selectedIndex);
  }

  bottomNavChange(int index) {
    if (index > _selectedIndex + 1 || index < _selectedIndex - 1) {
      _jump = true;
    }
    setState(() {
      _selectedIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 350), curve: Curves.ease);
    });
  }

  pageViewChange(int index) {
    if (_jump) {
      if (_selectedIndex == index) {
        setState(() {
          _selectedIndex = index;
          _jump = false;
        });
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // surfaceTintColor: themeProvider.isDark
          //     ? const Color(0xFF202525)
          //     : Theme.of(context).colorScheme.background,
          elevation: 1,
          // shadowColor: Theme.of(context).colorScheme.onPrimary.withAlpha(100),
          // backgroundColor: themeProvider.isDark
          //     ? const Color(0xFF202525)
          //     : Theme.of(context).colorScheme.background,
          title: Text(
            "Home",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        bottomNavigationBar: BottomNavbar(
            selectedIndex: _selectedIndex, onChange: bottomNavChange),
        body: PageView(
          controller: pageController,
          onPageChanged: pageViewChange,
          children: const <Widget>[
            MessagesPage(),
            ChannelsPage(),
            NotificationsPage(),
          ],
        ));
  }
}
