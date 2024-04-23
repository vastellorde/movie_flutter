import 'package:movie/core/module/di_registrator.dart';

abstract interface class ModuleDependencies {
  Future<void> register(DIRegistrator di);
}
