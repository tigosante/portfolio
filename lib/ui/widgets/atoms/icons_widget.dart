import 'package:enefty_icons/enefty_icons.dart' show EneftyIcons;
import 'package:flutter/material.dart';

enum IconType {
  arrowRight;

  IconData get getIcon {
    return switch (this) {
      IconType.arrowRight => EneftyIcons.arrow_right_2_outline,
    };
  }
}

class IconsWidget extends StatelessWidget {
  const IconsWidget({
    required IconType iconType,
    super.key,
    Color? color,
  })  : _color = color,
        _iconType = iconType;

  final Color? _color;
  final IconType _iconType;

  factory IconsWidget.arrowRight({Color? color}) => IconsWidget(iconType: IconType.arrowRight, color: color);

  @override
  Widget build(BuildContext context) {
    return Icon(
      _iconType.getIcon,
      color: _color,
    );
  }
}
