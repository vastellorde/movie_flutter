import 'package:flutter/material.dart';
import 'package:movie/app/router/router.dart';
import 'package:talker_flutter/talker_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    required this.router,
    required this.talker,
    super.key,
  });

  final AppRouter router;
  final Talker talker;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(
        navigatorObservers: () => [
          TalkerRouteObserver(talker),
        ],
      ),
    );
  }
}
