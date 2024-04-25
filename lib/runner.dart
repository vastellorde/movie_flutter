import 'package:flutter/material.dart';
import 'package:movie/app/app.dart';
import 'package:movie/app/app_module.dart';
import 'package:movie/app/router/router.dart';
import 'package:movie/core/infrastructure/logger/logger_wrapper.dart';

abstract class Runner {
  static Future<void> run() async {
    final appModule = AppModule();
    appModule.di.get<LoggerWrapper>().info('Initialized');
    runApp(
      MyApp(
        router: appModule.di.get<AppRouter>(),
      ),
    );
  }
}
