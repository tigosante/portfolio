import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:portfolio/extensions/context_extension.dart';

class AppBarWidget extends PreferredSize {
  const AppBarWidget({
    super.key,
    required Widget child,
  })  : _child = child,
        super(
          child: const SizedBox(),
          preferredSize: const Size.fromHeight(kToolbarHeight - 10),
        );

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    final color = context.appColors.backgroundInverse;
    return Container(
      color: color.withOpacity(0.1),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            color: color.withOpacity(0.9),
            height: preferredSize.height,
            alignment: Alignment.center,
            child: _child,
          ),
        ),
      ),
    );
  }
}
