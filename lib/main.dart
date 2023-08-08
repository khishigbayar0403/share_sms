import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:share_sms/providers/auth_provider.dart';
import 'package:share_sms/providers/theme_provider.dart';
import 'package:share_sms/screens/get_started.dart';
import 'package:share_sms/screens/home/home.dart';
import 'package:share_sms/screens/login.dart';
import 'package:share_sms/screens/splash.dart';
import 'package:share_sms/utils/utils.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ChangeNotifierProvider(create: (_) => AuthProvider()),
    ],
    child: const MyApp(),
  ));
}

late GoRouter _router;
final List<String> publicPages = [GetStarted.path];
final List<String> unauthorizedPages = [
  Login.path,
  GetStarted.path,
  Splash.path
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    final authProvider = context.read<AuthProvider>();
    authProvider.init();

    _router = GoRouter(
      initialLocation: Splash.path,
      refreshListenable: authProvider,
      redirect: (context, state) async {
        dPrint("redirect ${state.fullPath} ${authProvider.loading}");
        if (authProvider.loading) {
          return Splash.path;
        }
        dPrint("main check ${authProvider.isAuth}");
        if (authProvider.isAuth == false) {
          if (!authProvider.seenGetStarted) {
            return GetStarted.path;
          }
          if (publicPages.contains(state.fullPath)) {
            return null;
          }
          return Login.path;
        }

        if (unauthorizedPages.contains(state.fullPath)) {
          return Home.path;
        }
        return null;
      },
      routes: <RouteBase>[
        GoRoute(
          path: GetStarted.path,
          builder: (BuildContext context, GoRouterState state) {
            return const GetStarted();
          },
        ),
        GoRoute(
          path: Splash.path,
          builder: (BuildContext context, GoRouterState state) {
            return const Splash();
          },
        ),
        GoRoute(
          path: Login.path,
          builder: (BuildContext context, GoRouterState state) {
            return const Login();
          },
        ),
        GoRoute(
            path: Home.path,
            builder: (BuildContext context, GoRouterState state) {
              return const Home();
            }
            //   routes: <RouteBase>[
            //     GoRoute(
            //       path: 'product/:id',
            //       pageBuilder: (BuildContext context, GoRouterState state) {
            //         final prodId = state.pathParameters['id']!;
            //         return CustomTransitionPage(
            //             child: ProductDetailScreen(productId: int.parse(prodId)),
            //             transitionDuration: const Duration(milliseconds: 300),
            //             reverseTransitionDuration: const Duration(milliseconds: 300),
            //             transitionsBuilder: (_, animation, secondaryAnimation, child) {
            //               return Stack(
            //                 children: [
            //                   FadeTransition(opacity: animation, child: child),
            //                 ],
            //               );
            //             });
            //       },
            //     ),
            //     GoRoute(
            //       path: 'filter',
            //       builder: (BuildContext context, GoRouterState state) {
            //         return const ProductFilterScreen();
            //       },
            //     )
            //   ],
            ),
      ],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      title: 'Share sms',
      theme: ThemeData(
        filledButtonTheme: FilledButtonThemeData(
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0))))),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF36bbb2),
            brightness:
                themeProvider.isDark ? Brightness.dark : Brightness.light),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
