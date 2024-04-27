import 'package:flutter/material.dart';
import 'package:movie/core/module/di.dart';
import 'package:movie/core/module/module.dart';

class ModuleCreator extends StatefulWidget {
  const ModuleCreator({
    required this.module,
    required this.builder,
    super.key,
  });

  final Module module;
  final Widget Function(BuildContext context, DI di) builder;

  @override
  State<ModuleCreator> createState() => _ModuleCreatorState();
}

class _ModuleCreatorState extends State<ModuleCreator> {
  @override
  void dispose() {
    widget.module.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      widget.module.di,
    );
  }
}
