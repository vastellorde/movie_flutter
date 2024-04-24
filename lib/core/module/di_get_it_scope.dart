import 'package:get_it/get_it.dart';
import 'package:movie/core/module/di_scope.dart';

final class DIGetItScope implements DIScope {
  DIGetItScope({required this.scopeName});

  final String scopeName;
  final GetIt _getIt = GetIt.instance;
  @override
  Future<void> dispose() async {
    await _getIt.dropScope(scopeName);
  }

  @override
  void register() {
    _getIt.pushNewScope(scopeName: scopeName);
  }
}
