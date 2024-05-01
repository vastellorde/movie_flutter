import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/app/app.dart';
import 'package:movie/app/app_module.dart';
import 'package:movie/app/router/router.dart';
import 'package:movie/core/infrastructure/logger/logger_wrapper.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';

abstract class Runner {
  static Future<void> run() async {
    final appModule = AppModule();
    await appModule.init();
    appModule.di.get<LoggerWrapper>().info('Initialized');
    final talker = appModule.di.get<Talker>();
    Bloc.observer = TalkerBlocObserver(talker: talker);
    runApp(
      MyApp(
        router: appModule.di.get<AppRouter>(),
        talker: talker,
      ),
    );
  }
}
