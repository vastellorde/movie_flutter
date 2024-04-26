// ignore_for_file: unnecessary_type_check

import 'package:flutter_test/flutter_test.dart';
import 'package:movie/core/module/di_registrator.dart';
import 'package:movie/core/module/module.dart';
import 'package:movie/core/module/module_dependencies.dart';

void main() {
  group('Test module', () {
    test(
      'intance created',
      () {
        final module = _FakeModule();
        final dependency = module.di.get<_FakeDependency>();
        expect(dependency is _FakeDependency, true);
      },
    );
  });
}

final class _FakeModule extends Module {
  _FakeModule()
      : super(
          dependencies: [
            _FakeModuleDependencies(),
          ],
        );
}

final class _FakeModuleDependencies extends ModuleDependencies {
  @override
  Future<void> register(DIRegistrator di) async {
    di.factory<_FakeDependency>(_FakeDependency.new);
  }
}

final class _FakeDependency {}
