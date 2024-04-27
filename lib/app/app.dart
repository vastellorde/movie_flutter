import 'package:flutter/material.dart';
import 'package:movie/app/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    required this.router,
    required this.navigatorObserver,
    super.key,
  });

  final AppRouter router;
  final NavigatorObserver navigatorObserver;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(
        navigatorObservers: () => [
          navigatorObserver,
        ],
      ),
    );
  }
}
