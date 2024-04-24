import 'package:flutter/material.dart';
import 'package:movie/app/app.dart';
import 'package:movie/app/app_module.dart';
import 'package:movie/app/router/router.dart';

abstract class Runner {
  static Future<void> run() async {
    final appModule = AppModule();
    runApp(
      MyApp(
        router: appModule.di.get<AppRouter>(),
      ),
    );
  }
}
