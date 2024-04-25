import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie/app/app.dart';
import 'package:movie/app/app_module.dart';
import 'package:movie/app/router/router.dart';
import 'package:movie/core/infrastructure/logger/logger_wrapper.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

abstract class Runner {
  static Future<void> run() async {
    final appModule = AppModule();

    appModule.di.get<LoggerWrapper>().info('Initialized');

    Bloc.observer = TalkerBlocObserver(
      talker: appModule.di.get<Talker>(),
    );

    runApp(
      MyApp(
        router: appModule.di.get<AppRouter>(),
        navigatorObserver: appModule.di.get<NavigatorObserver>(),
      ),
    );
  }
}
