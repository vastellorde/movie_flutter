import 'package:movie/core/module/di_registrator.dart';

abstract class ModuleDependencies {
  Future<void> register(DIRegistrator di);
}
