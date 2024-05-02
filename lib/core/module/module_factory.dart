import 'package:flutter/material.dart';
import 'package:movie/core/module/di.dart';
import 'package:movie/core/module/module.dart';

class ModuleFactory extends StatefulWidget {
  const ModuleFactory({
    required this.module,
    required this.builder,
    super.key,
  });

  final Module module;
  final Widget Function(BuildContext context, DI di) builder;

  @override
  State<ModuleFactory> createState() => _ModuleFactoryState();
}

class _ModuleFactoryState extends State<ModuleFactory> {
  @override
  void dispose() {
    widget.module.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final builder = widget.builder(
      context,
      widget.module.di,
    );

    if (widget.module.isInitialized) {
      return builder;
    }

    return FutureBuilder<bool>(
      future: widget.module.init(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return builder;
        }
        return const SizedBox.shrink();
      },
    );
  }
}
