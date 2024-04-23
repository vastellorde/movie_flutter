import 'package:flutter/material.dart';
import 'package:movie/app/router/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({required this.router, super.key});

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
    );
  }
}
