import 'package:flutter/material.dart';
import 'package:portfolio/common/common.dart' show BuildContextExtension, ColorSchemeExtension;

class CircledIconWidget extends StatelessWidget {
  const CircledIconWidget({
    required this.child,
    double size = 40,
    Color? color,
    Color? borderColor,
    EdgeInsetsGeometry? padding,
    super.key,
  })  : _size = size,
        _color = color,
        _padding = padding,
        _borderColor = borderColor;

  final Widget child;
  final double _size;
  final Color? _color;
  final Color? _borderColor;
  final EdgeInsetsGeometry? _padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      padding: _padding,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _color ?? context.colorScheme.transparent,
        border: Border.all(color: _borderColor ?? context.colorScheme.primary),
      ),
      child: child,
    );
  }
}
