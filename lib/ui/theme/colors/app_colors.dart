import 'package:flutter/material.dart' show Color, MaterialColor;

class AppColors {
  MaterialColor get primary => const MaterialColor(0xFF4831d4, <int, Color>{});

  MaterialColor get secondary =>
      const MaterialColor(0xFFccf381, <int, Color>{});

  MaterialColor get background =>
      const MaterialColor(0xFFFFFFFF, <int, Color>{});

  MaterialColor get surface => const MaterialColor(0xFFFFFFFF, <int, Color>{});

  MaterialColor get transparent =>
      const MaterialColor(0x00000000, <int, Color>{});

  MaterialColor get error => const MaterialColor(0xFFB00020, <int, Color>{});

  MaterialColor get onPrimary =>
      const MaterialColor(0xFFFFFFFF, <int, Color>{});

  MaterialColor get onSecondary =>
      const MaterialColor(0xFF000000, <int, Color>{});

  MaterialColor get onBackground =>
      const MaterialColor(0xFF000000, <int, Color>{});

  MaterialColor get onSurface =>
      const MaterialColor(0xFF000000, <int, Color>{});
}
