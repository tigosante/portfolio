import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LimitedBoxWidgetAtom extends StatelessWidget {
  const LimitedBoxWidgetAtom({
    required Widget child,
    super.key,
  }) : _child = child;

  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 300,
          maxWidth: 1200,
        ),
        child: _child,
      ),
    );
  }
}
