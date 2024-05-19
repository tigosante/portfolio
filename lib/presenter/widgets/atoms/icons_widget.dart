import 'package:enefty_icons/enefty_icons.dart' show EneftyIcons;
import 'package:flutter/material.dart';

enum IconType {
  link,
  profile,
  arrowRight,
  noImage;

  IconData? get getIcon {
    return switch (this) {
      IconType.link => EneftyIcons.link_2_bold,
      IconType.profile => EneftyIcons.profile_outline,
      IconType.arrowRight => EneftyIcons.arrow_right_2_outline,
      IconType.noImage => null,
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

  factory IconsWidget.noImage({Color? color}) => IconsWidget(iconType: IconType.noImage, color: color);
  factory IconsWidget.profile({Color? color}) => IconsWidget(iconType: IconType.profile, color: color);
  factory IconsWidget.link({Color? color}) => IconsWidget(iconType: IconType.profile, color: color);
  factory IconsWidget.arrowRight({Color? color}) => IconsWidget(iconType: IconType.arrowRight, color: color);

  @override
  Widget build(BuildContext context) {
    return Icon(
      _iconType.getIcon,
      color: _color,
    );
  }
}
