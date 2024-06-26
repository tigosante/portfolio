import 'package:flutter/material.dart' show Color, MaterialColor;
import 'package:portfolio/ui/theme/colors/app_colors.dart';

class AppColorsImpl implements AppColors {
  AppColorsImpl();

  @override
  final MaterialColor red = const MaterialColor(0xFFB00020, <int, Color>{});

  @override
  final MaterialColor blue = const MaterialColor(0xFF6ebae6, <int, Color>{});

  @override
  final MaterialColor white = const MaterialColor(0xFFffffff, <int, Color>{});

  @override
  final MaterialColor grey = const MaterialColor(0xFF6e6e76, <int, Color>{});

  @override
  final MaterialColor lighterGrey = const MaterialColor(0xFFf5f5f7, <int, Color>{});

  @override
  final MaterialColor ultraLightGrey = const MaterialColor(0xFFfafafa, <int, Color>{});

  @override
  final MaterialColor darkGrey = const MaterialColor(0xFF6e6e76, <int, Color>{});

  @override
  final MaterialColor black = const MaterialColor(0xFF000000, <int, Color>{});

  @override
  final MaterialColor black87 = const MaterialColor(0xFF2c2c34, <int, Color>{});

  @override
  final MaterialColor black95 = const MaterialColor(0xFF212126, <int, Color>{});

  @override
  final MaterialColor transparent = const MaterialColor(0x00000000, <int, Color>{});
}
