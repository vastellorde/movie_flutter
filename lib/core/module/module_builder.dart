import 'package:flutter/material.dart';
import 'package:movie/core/module/di.dart';
import 'package:movie/core/module/module.dart';

typedef ModuleCreate<T extends Module> = T Function();
typedef ModuleBuilderFunc<T extends Module> = Widget Function(
  BuildContext context,
  DI di,
);

final class ModuleBuilder<T extends Module> extends Widget {
  const ModuleBuilder({
    required this.builder,
    required this.create,
    super.key,
  });

  final ModuleBuilderFunc<T> builder;
  final ModuleCreate<T> create;

  @override
  ModuleBuilderElement createElement() => ModuleBuilderElement<T>(widget: this);
}

final class ModuleBuilderElement<T extends Module> extends ComponentElement {
  ModuleBuilderElement({
    required ModuleBuilder<T> widget,
  })  : _state = _ModuleState(create: widget.create),
        super(widget);

  final _ModuleState<T> _state;

  @override
  void mount(Element? parent, Object? newSlot) {
    super.mount(parent, newSlot);
    _state.init().then((_) => markNeedsBuild());
  }

  @override
  void unmount() {
    super.unmount();
    _state.dispose();
  }

  @override
  Widget build() {
    if (_state.module == null) {
      return const SizedBox.shrink();
    }
    return (widget as ModuleBuilder<T>).builder(
      this,
      _state.module!.di,
    );
  }
}

final class _ModuleState<T extends Module> {
  _ModuleState({
    required this.create,
  });

  final ModuleCreate<T> create;
  T? module;

  Future<void> init() async {
    if (module != null) {
      return;
    }
    module = create();
    await module?.init();
  }

  Future<void> dispose() async {
    await module?.dispose();
    module = null;
  }
}
