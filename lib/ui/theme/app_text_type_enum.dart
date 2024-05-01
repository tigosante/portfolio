import 'package:flutter/material.dart' show BuildContext, TextStyle;
import 'package:portfolio/extensions/extensions.dart'
    show BuildContextExtension;

enum AppTextTypeEnum {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelSmall;

  TextStyle getStyle(BuildContext context) {
    return switch (this) {
      AppTextTypeEnum.displayLarge => context.appTextTheme.displayLarge,
      AppTextTypeEnum.displayMedium => context.appTextTheme.displayMedium,
      AppTextTypeEnum.displaySmall => context.appTextTheme.displaySmall,
      AppTextTypeEnum.headlineMedium => context.appTextTheme.headlineMedium,
      AppTextTypeEnum.headlineSmall => context.appTextTheme.headlineSmall,
      AppTextTypeEnum.titleLarge => context.appTextTheme.titleLarge,
      AppTextTypeEnum.titleMedium => context.appTextTheme.titleMedium,
      AppTextTypeEnum.titleSmall => context.appTextTheme.titleSmall,
      AppTextTypeEnum.bodyLarge => context.appTextTheme.bodyLarge,
      AppTextTypeEnum.bodyMedium => context.appTextTheme.bodyMedium,
      AppTextTypeEnum.bodySmall => context.appTextTheme.bodySmall,
      AppTextTypeEnum.labelLarge => context.appTextTheme.labelLarge,
      AppTextTypeEnum.labelSmall => context.appTextTheme.labelSmall,
    };
  }
}
