import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:portfolio/ui/ui.dart' show BuildContextExtension;

class AppBarWidgetOrganism extends PreferredSize {
  const AppBarWidgetOrganism({
    required Widget child,
    super.key,
  })  : _child = child,
        super(
          child: const SizedBox(),
          preferredSize: const Size.fromHeight(kToolbarHeight - 10),
        );

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: context.colorScheme.surface.withOpacity(0.9),
          height: preferredSize.height,
          alignment: Alignment.center,
          child: _child,
        ),
      ),
    );
  }
}
