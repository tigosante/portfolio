import 'package:enefty_icons/enefty_icons.dart' show EneftyIcons;
import 'package:flutter/material.dart';

enum IconType {
  link,
  profile,
  arrowRight,
  search,
  noImage;

  IconData? get getIcon {
    return switch (this) {
      IconType.link => EneftyIcons.link_2_bold,
      IconType.profile => EneftyIcons.profile_outline,
      IconType.arrowRight => EneftyIcons.arrow_right_2_outline,
      IconType.search => EneftyIcons.search_normal_outline,
      IconType.noImage => null,
    };
  }
}

class IconsWidgetAtom extends StatelessWidget {
  const IconsWidgetAtom({
    required IconType iconType,
    super.key,
    Color? color,
    double? size,
  })  : _size = size,
        _color = color,
        _iconType = iconType;

  final double? _size;
  final Color? _color;
  final IconType _iconType;

  factory IconsWidgetAtom.noImage({Color? color, double? size}) => IconsWidgetAtom(
        iconType: IconType.noImage,
        size: size,
        color: color,
      );

  factory IconsWidgetAtom.search({Color? color, double? size}) => IconsWidgetAtom(
        iconType: IconType.search,
        size: size,
        color: color,
      );

  factory IconsWidgetAtom.profile({Color? color, double? size}) => IconsWidgetAtom(
        iconType: IconType.profile,
        size: size,
        color: color,
      );

  factory IconsWidgetAtom.link({Color? color, double? size}) => IconsWidgetAtom(
        iconType: IconType.profile,
        size: size,
        color: color,
      );

  factory IconsWidgetAtom.arrowRight({Color? color, double? size}) => IconsWidgetAtom(
        iconType: IconType.arrowRight,
        size: size,
        color: color,
      );

  @override
  Widget build(BuildContext context) {
    return Icon(
      _iconType.getIcon,
      color: _color,
      size: _size,
    );
  }
}
